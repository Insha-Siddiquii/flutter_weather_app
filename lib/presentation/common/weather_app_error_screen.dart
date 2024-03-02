import 'package:flutter/material.dart';

class WeatherAppErrorScreen extends StatelessWidget {
  final void Function() onPressed;
  const WeatherAppErrorScreen({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text(
            "Something went wrong!",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          ElevatedButton(
            onPressed: onPressed,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
            ),
            child: const Text(
              "Try again",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
