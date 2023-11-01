import 'package:freezed_annotation/freezed_annotation.dart';

part 'multiple_results.freezed.dart';

@freezed
class MultipleResult<T> with _$MultipleResult<T> {
  const factory MultipleResult.onError({
    required Failure error,
  }) = Error;

  const factory MultipleResult.onSuccess({
    required T data,
  }) = Success;
}

class Failure implements Exception {
  final String error;
  final int? code;
  final Exception? exception;
  final StackTrace? stackTrace;
  final String? value;
  final String? description;
  final String? precondition;

  Failure(
      {required this.error,
      this.code,
      this.exception,
      this.stackTrace,
      this.value,
      this.description,
      this.precondition});

  @override
  String toString() {
    return error;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Failure &&
        other.error == error &&
        other.code == code &&
        other.exception == exception;
  }

  @override
  int get hashCode {
    return error.hashCode ^ code.hashCode ^ exception.hashCode;
  }
}
