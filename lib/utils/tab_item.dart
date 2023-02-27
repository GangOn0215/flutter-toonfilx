import 'package:flutter/material.dart';
import 'package:toonflix/screens/home_screen.dart';
import 'package:toonflix/screens/pomodoro_screen.dart';
import 'package:toonflix/screens/study_screen.dart';
import 'package:toonflix/screens/wallets_screen.dart';

// https://suhwanc.tistory.com/200 창고

enum TabItem { home, wallets, study, pomodoro }

const Map<TabItem, String> tabName = {
  TabItem.home: 'home',
  TabItem.wallets: 'wallets',
  TabItem.study: 'study',
  TabItem.pomodoro: 'pomodoro',
};

const Map<TabItem, int> tabIdx = {
  TabItem.home: 0,
  TabItem.wallets: 1,
  TabItem.study: 2,
  TabItem.pomodoro: 3,
};

Map<TabItem, Widget> tabScreen = {
  TabItem.home: const HomeScreen(),
  TabItem.wallets: const WalletsScreen(),
  TabItem.study: const StudyScreen(),
  TabItem.pomodoro: const PomodoroScreen(),
};
