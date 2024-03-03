import 'package:flutter/material.dart';
import 'package:flutter_weather_app/presentation/entity/weather_daily_item_ui_entity.dart';

class WeatherDaysSlider extends StatelessWidget {
  const WeatherDaysSlider({
    super.key,
    required this.weatherList,
    required this.onWeatherCardClick,
  });

  final List<WeatherDailyItemUiEntity> weatherList;
  final void Function(WeatherDailyItemUiEntity selectedWeather)
      onWeatherCardClick;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: weatherList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => onWeatherCardClick(weatherList[index]),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 180,
              ),
              child: Column(
                children: [
                  Container(
                    width: 160,
                    height: 190,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 10.0,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          weatherList[index].shortDayName,
                          style: const TextStyle(
                            fontSize: 20.0,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        Image.network(
                          weatherList[index].imageUrl,
                          width: 70,
                          height: 70,
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        Text(
                          "${weatherList[index].maxTemperature}°/${weatherList[index].minTemperature}°",
                          style: const TextStyle(
                            fontSize: 20.0,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
