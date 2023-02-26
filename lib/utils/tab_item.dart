import 'package:flutter/material.dart';
import 'package:toonflix/screens/home.dart';
import 'package:toonflix/screens/study.dart';
import 'package:toonflix/screens/wallets.dart';

// https://suhwanc.tistory.com/200 창고

enum TabItem { home, wallets, study }

const Map<TabItem, String> tabName = {
  TabItem.home: 'home',
  TabItem.wallets: 'wallets',
  TabItem.study: 'state',
};

const Map<TabItem, int> tabIdx = {
  TabItem.home: 0,
  TabItem.wallets: 1,
  TabItem.study: 2,
};

Map<TabItem, Widget> tabScreen = {
  TabItem.home: const Home(),
  TabItem.wallets: const Wallets(),
  TabItem.study: const Study(),
};
