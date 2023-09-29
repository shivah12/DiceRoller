import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(DiceRollerApp());
}

class DiceRollerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dice Roller Game'),
          backgroundColor: Colors.lightGreen,
          elevation: 0,
        ),
        body: DiceRoller(),
        backgroundColor: Colors.green,
      ),
    );
  }
}

class DiceRoller extends StatefulWidget {
  @override
  _DiceRollerState createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  int dice1 = 1;
  int dice2 = 1;

  void rollDice() {
    setState(() {
      dice1 = Random().nextInt(6) + 1;
      dice2 = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Roll The Die!',
            style: TextStyle(
              fontFamily: 'Times New Roman',
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.lightGreenAccent,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                DiceFace(value: dice1),
                DiceFace(value: dice2),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: rollDice,
            child: Text(
              'Roll Dice',
              style: TextStyle(fontSize: 20),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.lightGreen,
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DiceFace extends StatelessWidget {
  final int value;

  DiceFace({required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Center(
        child: DiceDots(value: value),
      ),
    );
  }
}

class DiceDots extends StatelessWidget {
  final int value;

  DiceDots({required this.value});

  @override
  Widget build(BuildContext context) {
    List<Widget> dots = [];

    if ( value == 2 || value == 1 || value == 3) {
      for (int i = 0; i < value; i++) {
        dots.add(
          Container(
            width: 15,
            height: 15,
            margin: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        );
      }
    } else (){
      //
    };
    if (value == 4 || value == 5) {
      for (int i = 0; i < 2; i++) {
        List<Widget> rowDots = [];
        for (int j = 0; j < 2; j++) {
          rowDots.add(
            Container(
              width: 15,
              height: 15,
              margin: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          );
        }


        dots.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: rowDots,
          ),
        );
      }
    } else {

      /*dots.add(
        Container(
          width: 15,
          height: 15,
          margin: EdgeInsets.all(2),
          decoration: BoxDecoration(
             color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),
     );*/
    }
    int dotsPerRow = ( value == 6) ? 2 : 1;

    for (int row = 0; row < ( value == 6 ? 3 : 1); row++) {
      List<Widget> rowDots = [];
      for (int i = 0; i < dotsPerRow; i++) {
        rowDots.add(
          Container(
            width: 15,
            height: 15,
            margin: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        );
      }
      dots.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: rowDots,
        ),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: dots,
    );
  }
}



















