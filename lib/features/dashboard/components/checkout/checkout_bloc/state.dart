part of 'bloc.dart';

class CheckoutState extends Equatable {
  final AppMessage? message;
  final ServiceStatus status;
  final File? idPhoto;
  final String? idNumber;
  final String? otp;
  final File? signature;
  final List<File> orderImages;
  final List<File> dnote;
  final String? comment;
  final Order? order;
  final bool checkoutSuccess;
  final int step;

  const CheckoutState(
      {this.message,
      this.status = ServiceStatus.initial,
      this.orderImages = const [],
      this.order,
      this.dnote = const [],
      this.idPhoto,
      this.idNumber,
      this.signature,
      this.otp,
      this.comment,
      this.checkoutSuccess = false,
      this.step = 0});

  CheckoutState copyWith(
      {List<Trip>? pools,
      AppMessage? message,
      ServiceStatus? status,
      File? idPhoto,
      String? idNumber,
      String? otp,
      List<File>? orderImages,
      List<File>? dnote,
      File? signature,
      Order? order,
      String? comment,
      bool? checkoutSuccess,
      int? step}) {
    return CheckoutState(
      message: message,
      status: status ?? this.status,
      orderImages: orderImages ?? this.orderImages,
      order: order ?? this.order,
      otp: otp ?? this.otp,
      idPhoto: idPhoto ?? this.idPhoto,
      idNumber: idNumber ?? this.idNumber,
      signature: signature ?? this.signature,
      comment: comment ?? this.comment,
      checkoutSuccess: checkoutSuccess ?? false,
      dnote: dnote ?? this.dnote,
      step: step ?? this.step,
    );
  }

  @override
  List<Object?> get props => [
        message,
        status,
        orderImages,
        order,
        otp,
        idPhoto,
        idNumber,
        signature,
        comment,
        checkoutSuccess,
        step,
        dnote
      ];
}
