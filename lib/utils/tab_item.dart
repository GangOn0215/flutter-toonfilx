import 'package:flutter/material.dart';
import 'package:toonflix/screens/home.dart';
import 'package:toonflix/screens/study_state.dart';
import 'package:toonflix/screens/wallets.dart';

enum TabItem { home, wallets, state }

const Map<TabItem, String> tabName = {
  TabItem.home: 'home',
  TabItem.wallets: 'wallets',
  TabItem.state: 'state',
};

const Map<TabItem, int> tabIdx = {
  TabItem.home: 0,
  TabItem.wallets: 1,
  TabItem.state: 2,
};

Map<TabItem, Widget> tabScreen = {
  TabItem.home: const Home(),
  TabItem.wallets: const Wallets(),
  TabItem.state: const StudyState(),
};
