part of 'bloc.dart';

class CheckoutState extends Equatable {
  final AppMessage? message;
  final ServiceStatus status;
  final List<File> orderImages;
  final File? dnote;
  final File? idPhoto;
  final Order? order;
  final String? otp;
  final String? comment;
  final bool checkoutSuccess;
  final int step;
  final int maxStep;

  const CheckoutState(
      {this.message,
      this.status = ServiceStatus.initial,
      this.orderImages = const [],
      this.order,
      this.dnote,
      this.idPhoto,
      this.otp,
      this.comment,
      this.checkoutSuccess = false,
      this.step = 0,
      this.maxStep = 0});

  CheckoutState copyWith(
      {List<Trip>? pools,
      AppMessage? message,
      ServiceStatus? status,
      List<File>? orderImages,
      File? dnote,
      File? idPhoto,
      Order? order,
      String? otp,
      String? comment,
      bool? checkoutSuccess,
      int? step,
      int? maxStep}) {
    return CheckoutState(
      message: message,
      status: status ?? this.status,
      orderImages: orderImages ?? this.orderImages,
      order: order ?? this.order,
      otp: otp ?? this.otp,
      idPhoto: idPhoto ?? idPhoto,
      comment: comment ?? this.comment,
      checkoutSuccess: checkoutSuccess ?? false,
      dnote: dnote ?? this.dnote,
      step: step ?? this.step,
      maxStep: maxStep ?? this.maxStep,
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
        comment,
        checkoutSuccess,
        step,
        maxStep,
        dnote
      ];
}
