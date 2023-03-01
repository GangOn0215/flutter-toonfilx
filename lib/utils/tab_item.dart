import 'package:flutter/material.dart';
import 'package:toonflix/screens/home_screen.dart';
import 'package:toonflix/screens/pomodoro_screen.dart';
import 'package:toonflix/screens/study_screen.dart';
import 'package:toonflix/screens/toonflix_screen.dart';
import 'package:toonflix/screens/wallets_screen.dart';

// https://suhwanc.tistory.com/200 창고

enum TabItem { wallets, study, home, pomodoro, toonflix }

const Map<TabItem, String> tabName = {
  TabItem.wallets: 'wallets',
  TabItem.study: 'study',
  TabItem.home: 'home',
  TabItem.pomodoro: 'pomodoro',
  TabItem.toonflix: 'toonflix',
};

const Map<TabItem, int> tabIdx = {
  TabItem.wallets: 0,
  TabItem.study: 1,
  TabItem.home: 2,
  TabItem.pomodoro: 3,
  TabItem.toonflix: 4,
};

Map<TabItem, Widget> tabScreen = {
  TabItem.wallets: const WalletsScreen(),
  TabItem.study: const StudyScreen(),
  TabItem.home: const HomeScreen(),
  TabItem.pomodoro: const PomodoroScreen(),
  TabItem.toonflix: const ToonflixScreen()
};
