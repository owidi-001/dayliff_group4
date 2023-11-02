import 'dart:async';
import 'dart:io';

import 'package:dayliff/data/local/local.dart';
import 'package:dayliff/data/models/auth/login.dart';
import 'package:dayliff/data/models/error/error_handler.dart';
import 'package:dayliff/data/models/multiple_results/multiple_results.dart';
import 'package:dayliff/data/models/route/route.dart';
import 'package:dayliff/data/repository/auth_repository.dart';
import 'package:dayliff/data/service/maps.dart';
import 'package:dayliff/utils/constants.dart';
import 'package:dio_http_formatter/dio_http_formatter.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
part 'http_client.dart';
part 'client.dart';

GetIt service = GetIt.asNewInstance();

setUpService() {
  service.registerLazySingleton<AuthService>(() => AuthService());
  service.registerLazySingleton<OrderService>(() => OrderService());
  service.registerLazySingleton<AddressService>(() => AddressService());
  service.registerLazySingleton<MapsService>(() => MapsService());
  service.registerLazySingleton<OrderConfirmationService>(
      () => OrderConfirmationService());
}

enum ServiceStatus {
  initial,
  loading,
  loadingSuccess,
  loadingFailure,
  submissionInProgress,
  submissionFailure,
  submissionSuccess,
}
