import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_weather_app/common/environment/environment.dart';
import 'package:flutter_weather_app/common/exception/base_exception.dart';
import 'package:flutter_weather_app/common/exception/network_exception.dart';
import 'package:flutter_weather_app/common/network/network_client.dart';

class DioNetworkClientImpl extends NetworkClient {
  final Dio _dio;

  DioNetworkClientImpl(
    this._dio,
  );

  @override
  Future<Either<HttpResponse, BaseException>> get(String unit) async {
    try {
      final response = await _dio.get(
        "https://api.openweathermap.org/data/3.0/onecall?lat=52.466439&lon=13.420308&units=$unit&exclude=hourly,minutely,alerts&appid=$apiKey",
      );
      return _handleResponse(response);
    } on DioException {
      return const Right(NetworkException("DIO_EXCEPTION"));
    }
  }

  Either<HttpResponse, BaseException> _handleResponse(
      Response<dynamic> response) {
    if (response.statusCode == 200) {
      return Left(response.data);
    } else {
      return const Right(NetworkException("NETWORK_EXCEPTION"));
    }
  }
}
