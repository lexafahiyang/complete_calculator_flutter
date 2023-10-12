import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator complete',
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String output = "0";
  String _output = "";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "x" ||
        buttonText == "/" ||
        buttonText == "sin" ||
        buttonText == "cos" ||
        buttonText == "tan" ||
        buttonText == "^") {
      num1 = double.parse(output);
      if (buttonText == "sin") {
        _output = sin(num1).toString();
      } else if (buttonText == "cos") {
        _output = cos(num1).toString();
      } else if (buttonText == "tan") {
        _output = tan(num1).toString();
      } else if (buttonText == "^") {
        _output = (num1 * num1).toString();
      } else {
        operand = buttonText;
        _output = "0";
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);
      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "x") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output += buttonText;
    }

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildButton(String buttonText, Color buttonColor) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: buttonColor,
        ),
        onPressed: () => buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator complete'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
              child: Text(
                output,
                style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Divider(),
            ),
            Column(
              children: <Widget>[
                Row(
                  children: [
                    buildButton("7", Colors.grey),
                    buildButton("8", Colors.grey),
                    buildButton("9", Colors.grey),
                    buildButton("/", Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    buildButton("4", Colors.grey),
                    buildButton("5", Colors.grey),
                    buildButton("6", Colors.grey),
                    buildButton("x", Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    buildButton("1", Colors.grey),
                    buildButton("2", Colors.grey),
                    buildButton("3", Colors.grey),
                    buildButton("-", Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    buildButton(".", Colors.grey),
                    buildButton("0", Colors.grey),
                    buildButton("C", Colors.red),
                    buildButton("+", Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    buildButton("sin", Colors.grey),
                    buildButton("cos", Colors.grey),
                    buildButton("tan", Colors.grey),
                    buildButton("^", Colors.orange),
                  ],
                ),
                Row(
                  children: [buildButton("=", Colors.orange)],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
