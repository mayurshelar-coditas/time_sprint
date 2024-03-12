import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_sprint/button_widget.dart';
import 'package:time_sprint/colors/colors.dart';

class StopwatchWidget extends StatefulWidget {
  const StopwatchWidget({super.key});
  @override
  State<StopwatchWidget> createState() => _StopwatchWidgetState();
}

class _StopwatchWidgetState extends State<StopwatchWidget> {
  final Stopwatch _stopwatch = Stopwatch();
  Timer? _timer;
  bool isRunning = false;
  List<String> lapsedTime = [];

  @override
  Widget build(context) {
    double progress = (_stopwatch.elapsedMilliseconds % 60000) / 60000;
    String formattedTime = _formatTime(_stopwatch.elapsedMilliseconds ~/ 1000);

    var startButton = ButtonWidget(
      title: "START",
      onTap: _startTimer,
    );
    var stopButton = ButtonWidget(
      title: "STOP",
      onTap: _stopTimer,
    );
    var resetButton = ButtonWidget(
      title: "RESET",
      onTap: _resetTimer,
    );
    var lapButton = ButtonWidget(
      title: "LAP",
      onTap: () => lapsedTime.add(formattedTime),
    );

    return Container(
      decoration: const BoxDecoration(
        color: CustomColors.lightBackgroundColor,
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(padding: EdgeInsets.only(top: 50)),
            Card(
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
                    shadowColor: const Color.fromARGB(255, 1, 6, 19),
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
            ),
            const Padding(
              padding: EdgeInsets.all(10),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 40),
                ),
                isRunning ? lapButton : resetButton,
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.only(right: 40),
                ),
                isRunning ? stopButton : startButton,
                const Padding(
                  padding: EdgeInsets.only(right: 40),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.all(10)),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => Center(
                  child: Card(
                    color: CustomColors.darkBackgroundColor,
                    elevation: 4,
                    shadowColor: CustomColors.shadowColor,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(35, 10, 35, 10),
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
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(15),
            ),
          ],
        ),
      ),
    );
  }

  void _startTimer() {
    _stopwatch.start();
    isRunning = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  void _stopTimer() {
    isRunning = false;
    _stopwatch.stop();
    _timer!.cancel();
    setState(() {});
  }

  void _resetTimer() {
    isRunning = false;
    _stopTimer();
    _stopwatch.reset();
    setState(() {
      lapsedTime = [];
    });
  }

  String _formatTime(int seconds) {
    String hours = (seconds ~/ 3600).toString().padLeft(2, '0');
    String minutes = ((seconds % 3600) ~/ 60).toString().padLeft(2, '0');
    String secs = (seconds % 60).toString().padLeft(2, '0');

    return '$hours:$minutes:$secs';
  }
}
