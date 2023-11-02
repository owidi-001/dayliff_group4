part of "bloc.dart";

abstract class ConfirmationEvent extends Equatable {
  const ConfirmationEvent();

  @override
  List<Object?> get props => [];
}

class StartOrderConfirmationBloc extends ConfirmationEvent {}

class SaveCapturedImage extends ConfirmationEvent {
  final File image;

  const SaveCapturedImage({required this.image});

  @override
  List<Object?> get props => [image];
}

class RemoveCaptured extends ConfirmationEvent {
  final int index;

  const RemoveCaptured({required this.index});

  @override
  List<Object?> get props => [index];
}

class OtpChanged extends ConfirmationEvent {
  final String? otp;

  const OtpChanged({this.otp});
}

class CommentsChanged extends ConfirmationEvent {
  final String? comment;

  const CommentsChanged({this.comment});
}

class VerifyOTP extends ConfirmationEvent {
  final String code;

  const VerifyOTP({required this.code});

  @override
  List<Object?> get props => [code];
}

class ConfirmDelivery extends ConfirmationEvent {}
