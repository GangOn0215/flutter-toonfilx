import 'package:flutter/material.dart';
import 'package:toonflix/utils/common.dart';

class WidgetLifeCycle extends StatefulWidget {
  const WidgetLifeCycle({super.key});

  @override
  State<WidgetLifeCycle> createState() => _WidgetLifeCycleState();
}

class _WidgetLifeCycleState extends State<WidgetLifeCycle> {
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
      appBar: buildAppBar(
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
