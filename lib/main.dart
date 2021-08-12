import 'dart:math';
import 'package:numberpicker/numberpicker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purple.shade700,
        appBar: AppBar(
          title: Text('DICE ROLL'),
          backgroundColor: Colors.purple.shade900,
          elevation: 0,
          centerTitle: true,
        ),
        body: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> diceList = [
    "one.png",
    "two.png",
    "three.png",
    "four.png",
    "five.png",
    "six.png"
  ];
  Random number = Random(10);
  int rightDiceNumber = 3;
  int leftDiceNumber = 5;
  int _currentValue = 3;
  bool flag = false;
  bool lessThan = false;
  bool greaterThan = false;
  bool equalTo = false;
  var correct = Text(
    'YOU GOT IT RIGHT!',
    style: TextStyle(
      color: Colors.grey.shade900,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  );
  var wrong = Text(
    'NAH NAH',
    style: TextStyle(
        color: Colors.red.shade900, fontSize: 20, fontWeight: FontWeight.bold),
  );
  void lessThanFunc(int sum) {
    setState(
      () {
        flag = false;
      },
    );
    bool result = sum < _currentValue ? true : false;
    print(
        "lessThanFunc called sum: ${sum} result: ${result} left: ${leftDiceNumber} right: ${rightDiceNumber} currentval: ${_currentValue}");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: result ? correct : wrong,
        duration: const Duration(milliseconds: 2500),
        width: 280.0, // Width of the SnackBar.
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(
            horizontal: 16, vertical: 20 // Inner padding for SnackBar content.
            ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  void greaterThanFunc(int sum) {
    setState(() {
      flag = false;
    });
    bool result = sum > _currentValue ? true : false;
    print(
        "greaterThanFunc called sum: ${sum} result: ${result} left: ${leftDiceNumber} right: ${rightDiceNumber} currentval: ${_currentValue}");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: result ? correct : wrong,
        duration: const Duration(milliseconds: 2500),
        width: 280.0, // Width of the SnackBar.
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(
            horizontal: 16, vertical: 20 // Inner padding for SnackBar content.
            ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  void equalToFunc(int sum) {
    setState(() {
      flag = false;
    });
    bool result = _currentValue == sum ? true : false;
    print(
        "equalToFunc called sum: ${sum} result: ${result} left: ${leftDiceNumber} right: ${rightDiceNumber} currentval: ${_currentValue}");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: result ? correct : wrong,
        duration: const Duration(milliseconds: 2500),
        width: 280.0, // Width of the SnackBar.
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(
            horizontal: 16, vertical: 20 // Inner padding for SnackBar content.
            ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  void changeDiceFace() {
    setState(() {
      rightDiceNumber = number.nextInt(6);
      leftDiceNumber = number.nextInt(6);
      flag = true;
    });
    int sum = rightDiceNumber + leftDiceNumber + 2;
    if (lessThan) {
      lessThanFunc(sum);
      setState(() {
        lessThan = false;
      });
      return;
    }
    if (greaterThan) {
      greaterThanFunc(sum);
      setState(() {
        greaterThan = false;
      });
      return;
    }
    if (equalTo) {
      equalToFunc(sum);
      setState(() {
        equalTo = false;
      });
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                OutlinedButton(
                  child: Text(
                    '>',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.green.shade400,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      greaterThan = true;
                    });
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.fromLTRB(40, 20, 40, 20),
                    ),
                  ),
                ),
                OutlinedButton(
                  child: Text(
                    '=',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      equalTo = true;
                    });
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.fromLTRB(40, 20, 40, 20),
                    ),
                  ),
                ),
                OutlinedButton(
                  child: Text(
                    '<',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.red,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      lessThan = true;
                    });
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.fromLTRB(40, 20, 40, 20),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: NumberPicker(
              value: _currentValue,
              axis: Axis.horizontal,
              minValue: 2,
              maxValue: 12,
              textStyle: TextStyle(
                color: Colors.yellow.shade600,
                fontSize: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.zero,
                border: Border.all(color: Colors.black26),
              ),
              selectedTextStyle: TextStyle(
                color: Colors.yellow.shade600,
                fontSize: 30,
              ),
              onChanged: (value) => setState(
                () => {_currentValue = value, flag = true},
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(
                    'images/${diceList[leftDiceNumber]}',
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Image.asset(
                    'images/${diceList[rightDiceNumber]}',
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ElevatedButton(
              style: flag ? yes : no,
              onPressed: flag == true
                  ? () {
                      changeDiceFace();
                    }
                  : null,
              child: const Text(
                'ROLL',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  var no = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade300),
    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
      EdgeInsets.fromLTRB(20, 10, 20, 10),
    ),
  );
  var yes = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade700),
    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
      EdgeInsets.fromLTRB(20, 10, 20, 10),
    ),
  );
}
