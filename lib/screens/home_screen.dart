import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_sprint/colors/colors.dart';
import 'package:time_sprint/stop_watch_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Time Sprint',
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: CustomColors.lightBackgroundColor,
      ),
      body: const StopwatchWidget(),
    );
  }
}
