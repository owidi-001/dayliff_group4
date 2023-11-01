part of 'service.dart';

class AuthService {
  HttpResult<AuthToken> login(LoginData request) => Http.post(
        "login/",
        request.toJson(),
        deserializer: (json) => AuthToken.fromJson(json),
      ).then((value) {
        value.when(
          onError: (error) {},
          onSuccess: (token) {
            // storeAuthToken(token.token, token.refreshToken);
            // FirebasePushNotification.instance
            //     .sendDeviceTokenToServer(token.token);
          },
        );
        return value;
      });
}

class OrderService {
  HttpResult<List<RoutePool>> all() => Http.get(
        "/routes/",
        deserializer: (data) => List<RoutePool>.from(
            data.map((e) => RoutePool.fromJson(e)).toList()),
      );

  HttpResult<Order> confirmDelivery(
      {File? confirmationImage, File? signature, required Order order}) async {
    FormData data = FormData.fromMap(order.toJson());

    if (signature != null) {
      var signatureFile = await MultipartFile.fromFile(signature.path);
      data.files.add(MapEntry('signature', signatureFile));
    }

    if (confirmationImage != null) {
      var orderImage = await MultipartFile.fromFile(confirmationImage.path);
      data.files.add(MapEntry('order_image', orderImage));
    }

    return Http.post(
      "/confirm_delivery/",
      data,
      deserializer: (json) => Order.fromJson(json),
    );
  }
}

// class ReturnService {
//   HttpResult<List<Return>> all() => Http.get(
//         "/returns/",
//         deserializer: (data) => List<RoutePool>.from(
//             data.map((e) => RoutePool.fromJson(e)).toList()),
//       );

//   HttpResult<Order> confirmDelivery(
//       {File? confirmationImage, File? signature, required Order order}) async {
//     FormData data = FormData.fromMap(order.toJson());

//     if (signature != null) {
//       var signatureFile = await MultipartFile.fromFile(signature.path);
//       data.files.add(MapEntry('signature', signatureFile));
//     }

//     if (confirmationImage != null) {
//       var orderImage = await MultipartFile.fromFile(confirmationImage.path);
//       data.files.add(MapEntry('order_image', orderImage));
//     }

//     return Http.post(
//       "/confirm_delivery/",
//       data,
//       deserializer: (json) => Order.fromJson(json),
//     );
//   }
// }

class ProfileService {
  HttpResult<Driver> fetchProfile() => Http.get(
        "/rider/profile/",
        deserializer: (json) => Driver.fromJson(json["driver"]),
      );

  HttpResult<Driver> updateProfile(DriverUpdate request) async {
    final data = request.toJson();

    return Http.put(
      "/profile/",
      data,
      // options: Options(
      //   headers: {
      //     Headers.contentTypeHeader: "multipart/form-data",
      //   },
      // ),
      deserializer: (json) => Driver.fromJson(json),
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
