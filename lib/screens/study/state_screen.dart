import 'package:flutter/material.dart';
import 'package:toonflix/utils/common.dart';
import 'package:toonflix/widgets/study/state_button_small.dart';

class StateScreen extends StatefulWidget {
  const StateScreen({super.key});

  @override
  State<StateScreen> createState() => _StateScreenState();
}

class _StateScreenState extends State<StateScreen> {
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
      appBar: buildAppBar(title: 'State', context: context),
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
