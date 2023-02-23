import 'package:flutter/material.dart';

class Player {
  String? name;

  Player({this.name});
}

void main() {
  var player = Player(name: 'Coxe');

  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF131313),
        // backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Coxe'),
          backgroundColor: Colors.deepPurple,
          shadowColor: Color.fromRGBO(255, 178, 178, 1),
          elevation: 5,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            children: [
              SizedBox(
                  // height: 10,
                  ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Hey, Coxe',
                        style: TextStyle(
                            color: Color.fromRGBO(255, 178, 178, 1),
                            fontSize: 22,
                            fontWeight: FontWeight.w800),
                      ),
                      Text(
                        'sleep',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
