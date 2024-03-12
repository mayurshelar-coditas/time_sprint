import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_sprint/colors/colors.dart';

///Widget for building listView for laps list
class LapsListWidget extends StatelessWidget {
  const LapsListWidget({required this.lapsedTime, super.key});

  final List<String> lapsedTime;

  @override
  Widget build(context) {
    return ListView.builder(
      itemBuilder: (context, index) => Center(
        child: Card(
          color: CustomColors.darkBackgroundColor,
          elevation: 4,
          shadowColor: CustomColors.shadowColor,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              lapsedTime[index],
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  color: CustomColors.foregroundColor,
                  fontSize: 24),
            ),
          ),
        ),
      ),
      itemCount: lapsedTime.length,
    );
  }
}
