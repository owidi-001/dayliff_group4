part of 'bloc.dart';

class CheckoutState extends Equatable {
  final String? message;
  final ServiceStatus status;
  final List<File> orderImages;
  final File? dnote;
  final File? idPhoto;
  final Order? order;
  final String? otp;
  final String? comment;
  final bool otpVerified;
  final int step;

  const CheckoutState(
      {this.message,
      this.status = ServiceStatus.initial,
      this.orderImages = const [],
      this.order,
      this.dnote,
      this.idPhoto,
      this.otp,
      this.comment,
      this.otpVerified = false,
      this.step = 0});

  CheckoutState copyWith(
      {List<Trip>? pools,
      String? message,
      ServiceStatus? status,
      List<File>? orderImages,
      File? dnote,
      File? idPhoto,
      Order? order,
      String? otp,
      String? comment,
      bool? otpVerified,
      int? step}) {
    return CheckoutState(
        message: message,
        status: status ?? this.status,
        orderImages: orderImages ?? this.orderImages,
        order: order ?? this.order,
        otp: otp ?? this.otp,
        idPhoto: idPhoto ?? idPhoto,
        comment: comment ?? this.comment,
        otpVerified: otpVerified ?? this.otpVerified,
        dnote: dnote ?? this.dnote,
        step: step ?? this.step);
  }

  @override
  List<Object?> get props => [
        message,
        status,
        orderImages,
        order,
        otp,
        idPhoto,
        comment,
        otpVerified,
        step,
        dnote
      ];
}
