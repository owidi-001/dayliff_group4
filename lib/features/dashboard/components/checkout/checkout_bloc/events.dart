part of "bloc.dart";

abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();

  @override
  List<Object?> get props => [];
}

class UpdateStep extends CheckoutEvent {
  final int step;
  const UpdateStep({required this.step});

  @override
  List<Object?> get props => [step];
}

class StepContinue extends CheckoutEvent {}

class StepComplete extends CheckoutEvent {}

class StepCancelled extends CheckoutEvent {}

class SaveCapturedImage extends CheckoutEvent {
  final File image;

  const SaveCapturedImage({required this.image});

  @override
  List<Object?> get props => [image];
}

class ScanOD extends CheckoutEvent {
  final File image;

  const ScanOD({required this.image});

  @override
  List<Object?> get props => [image];
}

class IDProof extends CheckoutEvent {
  final File image;

  const IDProof({required this.image});

  @override
  List<Object?> get props => [image];
}

class SignatureChanged extends CheckoutEvent {
  final File file;

  const SignatureChanged({required this.file});
}

class OtpChanged extends CheckoutEvent {
  final String? otp;

  const OtpChanged({this.otp});
}

class CommentsChanged extends CheckoutEvent {
  final String? comment;

  const CommentsChanged({this.comment});
}
