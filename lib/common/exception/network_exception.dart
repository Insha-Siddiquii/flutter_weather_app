import 'package:flutter_weather_app/common/exception/base_exception.dart';

class NetworkException extends BaseException {
  const NetworkException(super.message);

  @override
  List<Object?> get props => [
        super.message,
      ];
}
