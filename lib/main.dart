import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Text('Dice Roll'),
          backgroundColor: Colors.red,
        ),
        body: const DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  // for static app use stateless widget and vice versa
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNum =
      1; // initializing here and updating in build method for hot reload and saving memory
  int rightDiceNum = 1;

  void updateNum() {
    setState(() {
      leftDiceNum = Random().nextInt(6) + 1;
      rightDiceNum = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            // flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  // setState(() {
                  // to specify that state is being updated, whenever the state or the UI is about to change, we call this method
                  // leftDiceNum = 5;
                  // leftDiceNum = Random().nextInt(6) + 1;
                  // rightDiceNum = Random().nextInt(6) + 1;
                  updateNum();
                  // });
                },
                child: Image.asset('images/dice$leftDiceNum.png'),
              ),
            ), //Image.network also available, makes it less nesting and complicated
          ),
          Expanded(
            // flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  // setState(() {
                  // leftDiceNum = Random().nextInt(6) + 1;
                  // rightDiceNum = Random().nextInt(6) + 1;
                  updateNum();
                  // });
                },
                child: Image.asset('images/dice$rightDiceNum.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class DicePage extends StatelessWidget {
//   DicePage({Key? key}) : super(key: key);
//
//
// }
