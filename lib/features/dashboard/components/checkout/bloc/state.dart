part of 'bloc.dart';

class CheckoutState extends Equatable {
  final String? message;
  final ServiceStatus status;
  final List<File> orderImages;
  final Order? order;
  final String? otp;
  final String? comment;
  final bool otpVerified;

  const CheckoutState(
      {this.message,
      this.status = ServiceStatus.initial,
      this.orderImages = const [],
      this.order,
      this.otp,
      this.comment,
      this.otpVerified = false});

  CheckoutState copyWith(
      {List<RoutePool>? pools,
      String? message,
      ServiceStatus? status,
      List<File>? orderImages,
      Order? order,
      String? otp,
      String? comment,
      bool? otpVerified}) {
    return CheckoutState(
        message: message,
        status: status ?? this.status,
        orderImages: orderImages ?? this.orderImages,
        order: order ?? this.order,
        otp: otp ?? this.otp,
        comment: comment ?? this.comment,
        otpVerified: otpVerified ?? this.otpVerified);
  }

  @override
  List<Object?> get props =>
      [message, status, orderImages, order, otp, comment, otpVerified];
}
