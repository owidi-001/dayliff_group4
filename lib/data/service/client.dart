part of 'service.dart';

class AuthService {
  HttpResult<LoginResponse> login(LoginData request) async => Http.post(
        "login",
        request.toJson(),
        deserializer: (json) => LoginResponse.fromJson(json),
      ).then((value) {
        value.when(
          onError: (error) {
            // Do nothing
            // Handle in blocs
          },
          onSuccess: (token) {
            // Store user data
            AppUtility().storeUserData(token);
            // Sending firebase token
            print("Sending device token to server");
            service<FirebaseClientService>()
                .sendDeviceTokenToServer(token.token);
          },
        );
        return value;
      });

  HttpResult<dynamic> changePassword(String current, String newP) async {
    return Http.post("change-password", {"current": current, "new": newP});
  }

  HttpResult<String> updateProfile(ProfileData request) async {
    return Http.put(
      "users/${AuthenticationRepository.instance.user?.id}",
      request.toJson(),
      deserializer: (data) => data["message"],
    );
  }
}

class OrderService {
  HttpResult<List<Trip>> all() async => Http.get(
        "userdetails/${AuthenticationRepository.instance.user?.id}",
        deserializer: (data) =>
            List<Trip>.from(data.map((e) => Trip.fromJson(e)).toList()),
      );
}

class CheckoutService {
  // Start trip
  HttpResult<StartTripResponse> startTrip(
      {required StartTripRequest payload}) async {
    return Http.put(
      "/trips/${payload.tripId}",
      payload.toJson(),
      deserializer: (json) => StartTripResponse.fromJson(json),
    );
  }

  // Start navigation
  HttpResult<String> startNavigation(
      {required StartNavigationRequest payload}) async {
    return Http.put(
      "/orders/${payload.orderId}",
      payload.toJson(),
      deserializer: (json) => json["message"],
    );
  }

  // Start handover service
  HttpResult<String> startHandover(
      {required StartHandoverRequest payload}) async {
    return Http.post(
      "/deliveryconfirmations/${payload.orderId}",
      payload.copyWith(time: DateTime.now()).toJson(),
      deserializer: (json) => json["message"],
    );
  }

  // validate otp
  HttpResult<String> validateOtp(String code, int id) async {
    return Http.post(
      "/delivery-confirmations/verify-otp",
      {"otp": code, "order_id": id},
      deserializer: (json) => json["message"],
    );
  }

  HttpResult<String> validateId(String? idNumber, File? id, int orderId) async {
    FormData data = FormData.fromMap({"id_number": idNumber});
    // Receives id upload
    if (id != null) {
      var receiverId = await MultipartFile.fromFile(id.path);
      data.files.add(MapEntry('receiver_id', receiverId));
    }
    return Http.post(
      "/deliveryconfirmations/$orderId",
      data,
      deserializer: (json) => json["message"],
    );
  }

  HttpResult<String> updateOrder(int id, OrderStatus status) {
    debugPrint("The completed order: $status");

    return Http.put(
      "/orders/$id",
      {"order_status": status.toStringValue().toUpperCase()},
      deserializer: (json) => json["message"],
    );
  }

  HttpResult<String> updateTrip(int id, TripStatus status) async {
    debugPrint("The completed trip: $status");

    return Http.put(
      "/trips/$id",
      {"status": status.toStringValue().toUpperCase()},
      deserializer: (json) => json["message"],
    );
  }

  // Confirm the delivery
  HttpResult<String> confirmDelivery(
      {required OrderConfirmation confirmation}) async {
    FormData data = FormData.fromMap(confirmation.toJson());

    // Check for all image case
    // Customers signature upload
    if (confirmation.signature != null) {
      var signature =
          await MultipartFile.fromFile(confirmation.signature!.path);
      data.files.add(MapEntry('recipientsignature', signature));
    }
    // OD scan upload
    if (confirmation.dnote.isNotEmpty) {
      List<File> dnote = confirmation.dnote;

      for (int i = 0; i < dnote.length; i++) {
        File image = dnote[i];
        var orderImage = await MultipartFile.fromFile(
          image.path,
        );
        data.files.add(MapEntry('dodscan', orderImage));
      }
    }
    // Proof of delivery
    if (confirmation.orderImages.isNotEmpty) {
      List<File> orderImages = confirmation.orderImages;

      for (int i = 0; i < orderImages.length; i++) {
        File image = orderImages[i];
        var orderImage = await MultipartFile.fromFile(
          image.path,
        );
        data.files.add(MapEntry('dodphoto', orderImage));
      }
    }

    return Http.post(
      "/deliveryconfirmations/${confirmation.orderId}",
      data,
      deserializer: (json) => json["message"],
    );
  }
}

// Maps services
class MapsService {
  // Ftech company locations
  HttpResult<List<Address>> getCompanyLocations() => Http.get(
        "/company_locations",
        deserializer: (json) =>
            List<Address>.from(json.map((e) => Address.fromJson(e))),
      );

  // Ftech warehous locations
  HttpResult<List<Address>> getWarehouseLocations() => Http.get(
        "/warehouse_locations",
        deserializer: (json) =>
            List<Address>.from(json.map((e) => Address.fromJson(e))),
      );
}

// Firebase service
class FirebaseClientService {
  Future<void> sendDeviceTokenToServer([String? deviceToken]) async {
    print("RECEIVED TOKEN IS: ${deviceToken}");
    String? token = await FirebaseMessaging.instance.getToken();
    String? authToken =
        deviceToken ?? AuthenticationRepository.instance.authToken;
    final options = BaseOptions(
        baseUrl: BASE_URL,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(milliseconds: TIMEOUT),
        sendTimeout: const Duration(milliseconds: TIMEOUT),
        receiveTimeout: const Duration(milliseconds: TIMEOUT),
        headers: {"Authorization": 'Bearer $authToken'});

    final dio = Dio(options);
    if (token != null && authToken != null) {
      FormData data = FormData.fromMap({"firebasetokenfield": token});
      try {
        await dio.post("/register/", data: data);
        if (kDebugMode) {
          print('Device Token Sent to Server');
        }
      } catch (e) {
        if (kDebugMode) {
          print('Failed to send device token to the server: $e');
        }
      }
    }
  }
}

class TextMessageService {
  // Send message
  HttpResult<dynamic> sendMessage(String to, String message) async {
    return Http.post(
      "/sms",
      {"message": message, "phone": to},
      deserializer: (json) => json,
    );
  }
}
