import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_sprint/colors/colors.dart';

class StopwatchFace extends StatelessWidget {
  ///Contains watchface, circularProgressIndicator, and time in hh:mm:ss format
  const StopwatchFace(
      {required this.formattedTime, required this.progress, super.key});
  final double progress;
  final String formattedTime;

  @override
  Widget build(context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return Card(
        color: const Color.fromARGB(255, 6, 26, 79),
        elevation: 30,
        shape: const CircleBorder(),
        shadowColor: Colors.black,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 250,
              height: 250,
              child: CircularProgressIndicator(
                strokeCap: StrokeCap.round,
                value: progress,
                strokeWidth: 12,
                backgroundColor: CustomColors.darkBackgroundColor,
                color: CustomColors.foregroundColor,
              ),
            ),
            Card(
              color: CustomColors.darkBackgroundColor,
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.only(right: 7, left: 7),
                child: Text(
                  formattedTime,
                  style: GoogleFonts.montserrat(
                    color: CustomColors.foregroundColor,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Card(
        color: const Color.fromARGB(255, 6, 26, 79),
        elevation: 30,
        shape: const CircleBorder(),
        shadowColor: Colors.black,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 225,
              height: 225,
              child: CircularProgressIndicator(
                strokeCap: StrokeCap.round,
                value: progress,
                strokeWidth: 12,
                backgroundColor: CustomColors.darkBackgroundColor,
                color: CustomColors.foregroundColor,
              ),
            ),
            Card(
              color: CustomColors.darkBackgroundColor,
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.only(right: 7, left: 7),
                child: Text(
                  formattedTime,
                  style: GoogleFonts.montserrat(
                    color: CustomColors.foregroundColor,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
