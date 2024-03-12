import 'package:flutter/material.dart';
import 'package:time_sprint/colors/colors.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({required this.title, required this.onTap, super.key});

  final void Function() onTap;
  final String title;

  @override
  Widget build(context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        elevation: 10,
        shadowColor: CustomColors.shadowColor,
        padding: const EdgeInsets.all(30),
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
