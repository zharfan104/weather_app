import 'package:flutter/material.dart';
import 'package:weather_app/resources/constants/spacing.dart';

class ErrorText extends StatelessWidget {
  const ErrorText({
    super.key,
    required this.errorMessage,
  });

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kSpacingSmall),
        child: Text(
          errorMessage,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }
}
