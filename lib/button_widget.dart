import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({required this.buttonIcon, required this.title, required this.onTap, super.key});

  final void Function() onTap;
  final String title;
  // ignore: prefer_typing_uninitialized_variables
  final buttonIcon;

  @override
  Widget build(context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        elevation: 10,
        shadowColor: const Color.fromARGB(255, 59, 58, 58),
        foregroundColor: const Color.fromARGB(255, 0, 1, 1),
        backgroundColor: const Color.fromARGB(255, 96, 86, 86),
        textStyle:
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      ),
      onPressed: onTap,
      icon: buttonIcon,
      label: Text(title),
    );
  }
}
