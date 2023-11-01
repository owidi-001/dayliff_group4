import 'package:flutter_easyloading/flutter_easyloading.dart';

showError(String? message) => EasyLoading.showError(
      message ?? "An error occured!",
    );
showSuccess(String? message) =>
    EasyLoading.showSuccess(message ?? "Action successful");
showInfo(String message) => EasyLoading.showInfo(message);
showLoading(String? message) => EasyLoading.show(status: "Please wait...");
showToast(String message) => EasyLoading.showToast(message,toastPosition: EasyLoadingToastPosition.bottom);
