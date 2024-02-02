part of "bloc.dart";

abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();

  @override
  List<Object?> get props => [];
}

class StartCheckOutBloc extends CheckoutEvent {}

class SaveCapturedImage extends CheckoutEvent {
  final File image;

  const SaveCapturedImage({required this.image});

  @override
  List<Object?> get props => [image];
}

class RemoveCaptured extends CheckoutEvent {
  final int index;

  const RemoveCaptured({required this.index});

  @override
  List<Object?> get props => [index];
}

class OtpChanged extends CheckoutEvent {
  final String? otp;

  const OtpChanged({this.otp});
}

class CommentsChanged extends CheckoutEvent {
  final String? comment;

  const CommentsChanged({this.comment});
}

class VerifyOTP extends CheckoutEvent {
  final String code;

  const VerifyOTP({required this.code});

  @override
  List<Object?> get props => [code];
}

class ConfirmDelivery extends CheckoutEvent {}

class UpdateStep extends CheckoutEvent {
  final int step;
  const UpdateStep({required this.step});

  @override
  List<Object?> get props => [step];
}
