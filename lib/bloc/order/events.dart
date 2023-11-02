part of "bloc.dart";

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object?> get props => [];
}

class StartOrderBloc extends OrderEvent {}

class ImageCaptured extends OrderEvent {
  final File image;

  const ImageCaptured({required this.image});

  @override
  List<Object?> get props => [image];
}

class RemoveCaptured extends OrderEvent {
  final int index;

  const RemoveCaptured({required this.index});

  @override
  List<Object?> get props => [index];
}
