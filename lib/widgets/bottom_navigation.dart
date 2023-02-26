import 'package:flutter/material.dart';
import 'package:toonflix/utils/tab_item.dart';

class BottomNavigation extends StatelessWidget {
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  const BottomNavigation({
    super.key,
    required this.currentTab,
    required this.onSelectTab,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.wallet),
          label: 'Wallets',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.star_border),
          label: 'State',
        ),
      ],
      onTap: (index) => onSelectTab(
        TabItem.values[index],
      ),
      currentIndex: currentTab.index,
    );
  }
}
