// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:time_sprint/colors/colors.dart';
import 'package:time_sprint/screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

///Splash screen to enhance user experience.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 2500));
    Navigator.pushReplacement(
      ///As learning is at beginner to intermediate level we will ignore performance optimization warning.
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: CustomColors.lightBackgroundColor,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/image.png', height: 340),
              const SizedBox(height: 80),
              Text(
                "Time Sprint",
                style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.bold,
                    fontSize: 38,
                    color: CustomColors.foregroundColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
