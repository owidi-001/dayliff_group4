part of 'service.dart';

class AuthService {
  HttpResult<LoginResponse> login(LoginData request) => Http.post(
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
            AppUtility().storeUserData(token);
            service<FirebaseClientService>()
                .sendDeviceTokenToServer(token.token);
          },
        );
        return value;
      });

  HttpResult<dynamic> changePassword(String current, String newP) {
    return Http.post("change-password", {"current": current, "new": newP});
  }

  HttpResult<String> updateProfile(ProfileData request) {
    return Http.put(
      "users/${AuthenticationRepository.instance.user?.id}",
      request.toJson(),
      deserializer: (data) => data["message"],
    );
  }
}

class OrderService {
  HttpResult<List<Trip>> all() => Http.get(
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
  HttpResult<StartNavigationResponse> startNavigation(
      {required StartNavigationRequest payload}) async {
    return Http.put(
      "/start-navigation/",
      payload.toJson(),
      deserializer: (json) => json,
    );
  }

  // Start handover service
  HttpResult<StartHandoverResponse> startHandover(
      {required StartHandoverRequest payload}) async {
    return Http.put(
      "/start-handover/",
      payload.toJson(),
      deserializer: (json) => json,
    );
  }

  // validate otp
  HttpResult<String> validateOtp(String code, int id) {
    return Http.post(
      "/delivery-confirmations/verify-otp",
      {"otp": code, "id": id},
      deserializer: (json) => json,
    );
  }

  HttpResult<String> updateTrip(int id, TripStatus status) {
    return Http.post(
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
    // Receives id upload
    if (confirmation.receiverId != null) {
      var receiverId =
          await MultipartFile.fromFile(confirmation.receiverId!.path);
      data.files.add(MapEntry('receiver_id', receiverId));
    }
    // Customers signature upload
    if (confirmation.signature != null) {
      var signature =
          await MultipartFile.fromFile(confirmation.signature!.path);
      data.files.add(MapEntry('signature', signature));
    }
    // OD scan upload
    if (confirmation.odScan != null) {
      var odScan = await MultipartFile.fromFile(confirmation.odScan!.path);
      data.files.add(MapEntry('od_scan', odScan));
    }
    // Proof of delivery
    if (confirmation.orderImages.isNotEmpty) {
      List<File> orderImages = confirmation.orderImages;

      for (int i = 0; i < orderImages.length; i++) {
        File image = orderImages[i];
        var orderImage = await MultipartFile.fromFile(
          image.path,
        );
        data.files.add(MapEntry('images', orderImage));
      }
    }

    return Http.put(
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
      try {
        await dio.post("/fcm-token/", data: {"fcm_token": token});
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
