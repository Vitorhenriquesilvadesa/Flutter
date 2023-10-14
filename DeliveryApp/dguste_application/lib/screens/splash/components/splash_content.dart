import 'package:flutter/material.dart';

class SplashContent extends StatelessWidget {
  final String text;
  final String image;

  const SplashContent({super.key, required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(flex: 2),
        Text(
          "DGUST",
          style: Theme.of(context).textTheme.displayLarge,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const Spacer(),
        Image.asset(
          image,
          width: 260,
          height: 260,
        ),
      ],
    );
  }
}
