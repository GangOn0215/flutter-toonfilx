import 'package:flutter/material.dart';
import 'package:toonflix/screens/study/hero_screen.dart';
import 'package:toonflix/screens/study/build_context_screen.dart';
import 'package:toonflix/screens/study/state_screen.dart';
import 'package:toonflix/screens/study/widget_lifecycle_screen.dart';
import 'package:toonflix/utils/common.dart';
import 'package:toonflix/widgets/study/button_nav.dart';

class StudyScreen extends StatelessWidget {
  const StudyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'Study', context: context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonNav(
              text: 'State',
              builder: (context) => const StateScreen(),
            ),
            ButtonNav(
              text: 'BuildContext',
              builder: (context) => const StudyBuildContext(),
            ),
            ButtonNav(
              text: 'Widget Lifecycle',
              builder: (context) => const WidgetLifeCycle(),
            ),
            ButtonNav(
              text: 'Hero',
              builder: (context) => const HeroScreen(),
            )
          ],
        ),
      ),
    );
  }
}
