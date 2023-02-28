import 'dart:async';

import 'package:flutter/material.dart';

class PomodoroScreen extends StatefulWidget {
  const PomodoroScreen({super.key});

  @override
  State<PomodoroScreen> createState() => _PomodoroScreenState();
}

class _PomodoroScreenState extends State<PomodoroScreen> {
  final _backgroundColor = const Color(0XFFF77293);
  final _cardColor = const Color(0XFFFEF0F4);
  final _mainBlackColor = const Color(0xFF1E2124);

  static const initSeconds = 1500;

  int totalSeconds = 0; // 총시간
  int currentMin = 0;
  int currentSec = 0;
  int totalPomodoro = 0;
  bool isRunning = false; // 돌아가는 중?
  late Timer timer;

  String formatZero(int nMinSec) {
    if (nMinSec < 10) {
      return '0$nMinSec';
    } else {
      return '$nMinSec';
    }
  }

  @override
  void initState() {
    super.initState();

    reset(isEnd: false);
    // reset(false);
  }

  void reset({required bool isEnd}) {
    totalSeconds = initSeconds;
    calMinSec();

    if (isEnd) {
      onPausePressed();
    }
  }

  void calMinSec() {
    currentMin = totalSeconds ~/ 60;
    currentSec = (totalSeconds % 60).toInt();
  }

  void onTick(Timer timer) {
    if (totalSeconds <= 0) {
      reset(isEnd: true);
      totalPomodoro += 1;

      return;
    }

    setState(() {
      totalSeconds -= 1;

      calMinSec();
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
    reset(isEnd: true);
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
              color: _mainBlackColor,
              alignment: Alignment.bottomCenter,
              child: Text(
                '${formatZero(currentMin)}:${formatZero(currentSec)}',
                style: TextStyle(
                  color: _backgroundColor,
                  fontSize: 65,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.translate(
                  offset: const Offset(0, 25),
                  child: IconButton(
                    iconSize: 110,
                    icon: Icon(
                      isRunning
                          ? Icons.pause_circle_outline_outlined
                          : Icons.play_circle_outline_outlined,
                      color: _mainBlackColor,
                    ),
                    onPressed: isRunning ? onPausePressed : onStartPressed,
                  ),
                ),
                Transform.translate(
                  offset: const Offset(0, 25),
                  child: IconButton(
                    iconSize: 30,
                    icon: Icon(
                      Icons.restore,
                      color: _mainBlackColor,
                    ),
                    onPressed: onReset,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: _mainBlackColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Pomodoro',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: _backgroundColor,
                              ),
                            ),
                            Text(
                              '$totalPomodoro',
                              style: TextStyle(
                                fontSize: 48,
                                fontWeight: FontWeight.w600,
                                color: _cardColor,
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
