import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:time_sprint/button_widget.dart';

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
        buttonIcon: const Icon(Icons.start),
        title: "Start",
        onTap: _startTimer);
    var stopButton = ButtonWidget(
        buttonIcon: const Icon(Icons.stop), title: "Stop", onTap: _stopTimer);
    var resetButton = ButtonWidget(
        buttonIcon: const Icon(Icons.restart_alt_sharp),
        title: "Reset",
        onTap: _resetTimer);
    var lapButton = ButtonWidget(
        buttonIcon: const Icon(Icons.list),
        title: "Lap",
        onTap: () {
          lapsedTime.add(formattedTime);
        });

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color.fromARGB(255, 201, 33, 64), Colors.deepPurple],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(padding: EdgeInsets.only(top: 50)),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 250,
                  height: 250,
                  child: CircularProgressIndicator(
                    value: progress,
                    strokeWidth: 15,
                    backgroundColor: const Color.fromARGB(255, 176, 164, 164),
                    color: Colors.blue,
                  ),
                ),
                Text(
                  formattedTime,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
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
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => Center(
                  child: Card(
                    elevation: 15,
                    child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(lapsedTime[index])),
                  ),
                ),
                itemCount: lapsedTime.length,
              ),
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
