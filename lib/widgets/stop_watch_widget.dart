import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:time_sprint/widgets/button_widget.dart';
import 'package:time_sprint/colors/colors.dart';
import 'package:time_sprint/widgets/laps_list_widget.dart';
import 'package:time_sprint/widgets/stopwatch_face.dart';

class StopwatchWidget extends StatefulWidget {
  const StopwatchWidget({super.key});
  @override
  State<StopwatchWidget> createState() => _StopwatchWidgetState();
}

class _StopwatchWidgetState extends State<StopwatchWidget> {
  final Stopwatch _stopwatch = Stopwatch();
  Timer? _timer;
  bool isRunning = false;
  final List<String> lapsedTime = [];

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

    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return Container(
        decoration: const BoxDecoration(
          color: CustomColors.lightBackgroundColor,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 50),
              ),
              StopwatchFace(formattedTime: formattedTime, progress: progress),
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
              const Padding(
                padding: EdgeInsets.all(10),
              ),
              Expanded(
                child: LapsListWidget(lapsedTime: lapsedTime),
              ),
              const Padding(
                padding: EdgeInsets.all(15),
              ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        decoration: const BoxDecoration(
          color: CustomColors.lightBackgroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 40, top: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                children: [
                  StopwatchFace(
                    formattedTime: formattedTime,
                    progress: progress,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8),
                  ),
                  Row(
                    children: [
                      isRunning ? lapButton : resetButton,
                      isRunning ? stopButton : startButton,
                    ],
                  ),
                ],
              ),
              Expanded(
                child: LapsListWidget(
                  lapsedTime: lapsedTime,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
              ),
            ],
          ),
        ),
      );
    }
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
      lapsedTime.clear();
    });
  }

  String _formatTime(int seconds) {
    String hours = (seconds ~/ 3600).toString().padLeft(2, '0');
    String minutes = ((seconds % 3600) ~/ 60).toString().padLeft(2, '0');
    String secs = (seconds % 60).toString().padLeft(2, '0');

    return '$hours:$minutes:$secs';
  }
}
