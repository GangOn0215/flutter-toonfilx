import 'package:flutter/material.dart';
import 'package:toonflix/widgets/study/button_nav.dart';
import 'package:toonflix/widgets/study/state_button_small.dart';

class Study extends StatelessWidget {
  const Study({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(title: 'Study', context: context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonNav(
              text: 'State',
              builder: (context) => const StudyState(),
            ),
            ButtonNav(
              text: 'BuildContext',
              builder: (context) => const StudyBuildContext(),
            ),
          ],
        ),
      ),
    );
  }
}

class StudyState extends StatefulWidget {
  const StudyState({super.key});

  @override
  State<StudyState> createState() => _StudyStateState();
}

class _StudyStateState extends State<StudyState> {
  int count = 0;

  void onClickAdd() {
    setState(() {
      count += 1;
    });
  }

  void onClickMinus() {
    setState(() {
      count -= 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(title: 'State', context: context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Counter',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              '$count',
              style: const TextStyle(
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StateButtonSmall(
                  icon: Icons.add,
                  onPressed: onClickAdd,
                ),
                const SizedBox(
                  width: 10,
                ),
                StateButtonSmall(
                  icon: Icons.remove,
                  onPressed: onClickMinus,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

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
      appBar: _buildAppBar(
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
      'My Large Title',
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge!.color,
      ),
    );
  }
}

PreferredSizeWidget _buildAppBar({
  required String title,
  required BuildContext context,
}) {
  return AppBar(
    backgroundColor: Colors.black.withOpacity(0.7),
    centerTitle: true,
    title: Text(
      title,
      style: const TextStyle(
        color: Color(0xFFE75480),
      ),
    ),
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios_new_outlined),
      onPressed: () => {
        if (Navigator.canPop(context)) {Navigator.of(context).pop()}
      },
    ),
  );
}
