import 'package:flutter/material.dart';
import 'package:toonflix/utils/common.dart';

class StudyBuildContext extends StatefulWidget {
  const StudyBuildContext({super.key});

  @override
  State<StudyBuildContext> createState() => _StudyBuildContextState();
}

class _StudyBuildContextState extends State<StudyBuildContext> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4eddb),
      appBar: buildAppBar(
        title: 'Build Context',
        context: context,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyLargeTitle(),
          ],
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatelessWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Build Context',
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge!.color,
      ),
    );
  }
}
