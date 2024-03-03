// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_weather_app/utils/temperature_unit.dart';

class TemperatureValueConverter {
  TemperatureValueConverter();

  String getTemperatureUnitValue(TemperatureUnit unit) {
    if (unit == TemperatureUnit.celsius) {
      return "metric";
    } else {
      return "imperial";
    }
  }
}
