import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_weather_app/common/exception/base_exception.dart';

typedef HttpResponse = Map<String, dynamic>;

class NetworkResponse extends Equatable {
  final HttpResponse data;
  final int statusCode;
  final Map<String, String> headers;

  const NetworkResponse({
    required this.data,
    required this.statusCode,
    this.headers = const {},
  });

  @override
  List<Object?> get props => [data, statusCode, headers];
}

abstract class NetworkClient {
  Future<Either<HttpResponse, BaseException>> get(String unit);
}
