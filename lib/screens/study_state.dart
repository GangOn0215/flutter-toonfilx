import 'package:flutter/material.dart';

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
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: onClickAdd,
                    icon: const Icon(
                      size: 15,
                      Icons.add,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: onClickMinus,
                    icon: const Icon(
                      size: 15,
                      Icons.remove,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
