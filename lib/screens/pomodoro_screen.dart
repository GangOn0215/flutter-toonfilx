import 'dart:async';

import 'package:flutter/material.dart';

class PomodoroScreen extends StatefulWidget {
  const PomodoroScreen({super.key});

  @override
  State<PomodoroScreen> createState() => _PomodoroScreenState();
}

class _PomodoroScreenState extends State<PomodoroScreen> {
  final _backgroundColor = const Color(0xFFE7626C);
  final _textHeadline1 = const Color(0xFF232B55);
  final _cardColor = const Color(0xFFF4EDDB);

  int totalSeconds = 1500; // 총시간
  int totalPomodoro = 0;
  bool isRunning = false; // 돌아가는 중?
  late Timer timer;

  void onTick(Timer timer) {
    setState(() {
      totalSeconds -= 1;
    });
  }

  void onStartPressed() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );

    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();

    setState(() {
      isRunning = false;
    });
  }

  void onReset() {
    timer.cancel();
    setState(() {
      isRunning = false;
      totalSeconds = 1500;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                '$totalSeconds',
                style: TextStyle(
                  color: _cardColor,
                  fontSize: 89,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              child: IconButton(
                iconSize: 120,
                icon: Icon(
                  isRunning
                      ? Icons.pause_circle_filled_outlined
                      : Icons.play_circle_outline_outlined,
                  color: _cardColor,
                ),
                onPressed: isRunning ? onPausePressed : onStartPressed,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: _cardColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        isRunning
                            ? IconButton(
                                onPressed: onReset,
                                iconSize: 50,
                                icon: Icon(
                                  Icons.restore,
                                  color: _textHeadline1,
                                ),
                              )
                            : Column(
                                children: [
                                  Text(
                                    'Pomodoro',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: _textHeadline1,
                                    ),
                                  ),
                                  Text(
                                    '$totalPomodoro',
                                    style: TextStyle(
                                      fontSize: 48,
                                      fontWeight: FontWeight.w600,
                                      color: _textHeadline1,
                                    ),
                                  ),
                                ],
                              )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
