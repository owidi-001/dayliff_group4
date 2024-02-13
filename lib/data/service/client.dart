part of 'service.dart';

class AuthService {
  HttpResult<LoginResponse> login(LoginData request) => Http.post(
        "login",
        request.toJson(),
        deserializer: (json) => LoginResponse.fromJson(json),
      ).then((value) {
        value.when(
          onError: (error) {},
          onSuccess: (token) {
            AppUtility().storeUserData(token);
            // FirebasePushNotification.instance
            //     .sendDeviceTokenToServer(token.token);
          },
        );
        return value;
      });

  HttpResult<dynamic> changePassword(String current, String newP) {
    return Http.post("change-password", {"current": current, "new": newP});
  }

  HttpResult<String> updateProfile(ProfileData request) {
    return Http.post(
      "users/${AuthenticationRepository.instance.user?.id}",
      request.toJson(),
      deserializer: (data) => data["message"],
    );
  }
}

class OrderService {
  HttpResult<List<Trip>> all() => Http.get(
        "/routes/",
        deserializer: (data) => List<Trip>.from(
            data["routes"].map((e) => Trip.fromJson(e)).toList()),
      );
}

class OrderCheckoutService {
  // Verify OTP
  HttpResult<Map<String, dynamic>> verifyConfirmationCode(
      {required String code, required String orderId}) async {
    return Http.post(
      "/verify_otp/",
      {"otp": code, "order": orderId},
      deserializer: (json) => json,
    );
  }

  // Confirm the delivery
  // HttpResult<Order> confirmDelivery(
  //     {required DeliveryConfirmation deliveryConfirmation,
  //     File? proofImage}) async {
  //   FormData data = FormData.fromMap(deliveryConfirmation.toJson());

  //   if (proofImage != null) {
  //     var orderImage = await MultipartFile.fromFile(proofImage.path);
  //     data.files.add(MapEntry('images', orderImage));
  //   }

  //   return Http.post(
  //     "/confirm_delivery/",
  //     data,
  //     deserializer: (json) => Order.fromJson(json),
  //   );
  // }
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
