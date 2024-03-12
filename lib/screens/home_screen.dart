import 'package:flutter/material.dart';
import 'package:time_sprint/stop_watch_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Time Sprint'),
        ),
        backgroundColor: Colors.blue,
      ),
      body: const StopwatchWidget(),
    );
  }
}
