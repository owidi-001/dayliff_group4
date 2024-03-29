import 'package:dayliff/data/models/multiple_results/multiple_results.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ErrorHandler {
  final DioException error;

  ErrorHandler(this.error);

  Failure handle() {
    try {
      if (error.response?.data['error'] != null) {
        return Failure(error: error.response!.data['error']);
      } else {
        switch (error.type) {
          case DioExceptionType.connectionTimeout:
          case DioExceptionType.sendTimeout:
          case DioExceptionType.receiveTimeout:
            return Failure(error: "Request timeout!");
          case DioExceptionType.cancel:
            return Failure(error: 'Request canceled');
          case DioExceptionType.badResponse:
            final statusCode = error.response!.statusCode;
            switch (statusCode) {
              case 400:
                return Failure(
                  error: error.response?.data["error"] ??
                      error.response?.statusMessage ??
                      'Something went wrong',
                );
              case 401:
                // Go to login
                return Failure(
                    error: error.response?.data["error"] ??
                        error.response?.data["message"] ??
                        'Unauthorized');
              case 403:
                return Failure(
                    error: error.response?.data["error"] ??
                        error.response?.data["message"] ??
                        'Forbidden');
              case 404:
                return Failure(
                    error: error.response?.data["error"] ??
                        error.response?.data["message"] ??
                        'Resource not found');
              case 412:
                return Failure(
                  error: error.response!.data["error"] ??
                      error.response?.data["message"],
                  precondition: error.response?.data["precondition"],
                  description: error.response?.data["description"],
                  value: error.response?.data["value"],
                );
              case 500:
                return Failure(
                  error: error.response?.data["error"] ??
                      error.response?.data["message"] ??
                      'An error occured! Our team is resolving this!',
                );

              default:
                return Failure(
                    error: error.response?.data["error"] ??
                        error.response?.data["message"] ??
                        'Error: $statusCode');
            }
          default:
            return Failure(
                error: error.response?.data["error"] ?? 'Network error');
        }
      }
    } catch (e) {
      debugPrint(e.toString());
      return Failure(
          error: "An error occurred, kindly contact the developers.");
    }
  }
}
