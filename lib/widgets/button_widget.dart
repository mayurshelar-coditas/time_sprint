import 'package:flutter/material.dart';
import 'package:time_sprint/colors/colors.dart';

///Button Widget to avoid redundancy.
class ButtonWidget extends StatelessWidget {
  const ButtonWidget({required this.title, required this.onTap, super.key});

  ///Function to perform actions like start, stop, reset, lapping.
  final void Function() onTap;
  final String title;

  @override
  Widget build(context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        elevation: 10,
        shadowColor: CustomColors.shadowColor,
        padding: const EdgeInsets.all(32),
        foregroundColor: CustomColors.foregroundColor,
        backgroundColor: CustomColors.darkBackgroundColor,
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: onTap,
      child: Text(title),
    );
  }
}
