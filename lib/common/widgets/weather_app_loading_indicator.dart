import 'package:flutter/material.dart';

class WeatherAppLoadingIndicator extends StatelessWidget {
  const WeatherAppLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.black,
      ),
    );
  }
}
