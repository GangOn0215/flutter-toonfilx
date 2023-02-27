import 'package:flutter/material.dart';
import 'package:toonflix/widgets/study/button_nav.dart';
import 'package:toonflix/widgets/study/state_button_small.dart';

class StudyScreen extends StatelessWidget {
  const StudyScreen({super.key});

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
            ButtonNav(
              text: 'Widget Lifecycle',
              builder: (context) => const StudyWidgetLifeCycle(),
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
      'Build Context',
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge!.color,
      ),
    );
  }
}

class StudyWidgetLifeCycle extends StatefulWidget {
  const StudyWidgetLifeCycle({super.key});

  @override
  State<StudyWidgetLifeCycle> createState() => _StudyWidgetLifeCycleState();
}

class _StudyWidgetLifeCycleState extends State<StudyWidgetLifeCycle> {
  bool isLive = true;

  void toggleLive() {
    setState(() {
      isLive = !isLive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4eddb),
      appBar: _buildAppBar(
        title: 'Widget LifeCycle',
        context: context,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isLive ? const CycleLife() : const Text(''),
            const SizedBox(
              height: 20,
            ),
            IconButton(
              onPressed: toggleLive,
              icon: const Icon(Icons.delete),
            )
          ],
        ),
      ),
    );
  }
}

class CycleLife extends StatefulWidget {
  const CycleLife({
    super.key,
  });

  @override
  State<CycleLife> createState() => _CycleLifeState();
}

class _CycleLifeState extends State<CycleLife> {
  @override
  void initState() {
    super.initState();

    print('init');
  }

  @override
  void dispose() {
    super.dispose();

    print('dispose');
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return const Text(
      'Widget LifeCycle',
      style: TextStyle(
        fontSize: 30,
      ),
    );
  }
}

PreferredSizeWidget _buildAppBar({
  required String title,
  required BuildContext context,
}) {
  return AppBar(
    centerTitle: true,
    title: Text(
      title,
    ),
    leading: IconButton(
      icon: Icon(Navigator.canPop(context)
          ? Icons.arrow_back_ios_new_outlined
          : Icons.star_rounded),
      onPressed: () => {
        if (Navigator.canPop(context)) {Navigator.of(context).pop()}
      },
    ),
  );
}
