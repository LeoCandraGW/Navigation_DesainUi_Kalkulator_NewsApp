import 'package:flutter/material.dart';

class Kalkulator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
              children: <Widget>[
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 0, 225, 255),
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          Expanded(
            child: Container(
              color: Theme.of(context).primaryColor,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '0',
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
          GridView.count(
            padding: const EdgeInsets.all(0),
            shrinkWrap: true,
            crossAxisCount: 4,
            children: <Widget>[
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorLight,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: 'C',
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorLight,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '+/-',
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorLight,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '%',
              ),
              CalculatorButton.Icon(
                backgroundColor: Theme.of(context).primaryColorDark,
                foregroundColor: Theme.of(context).primaryColorLight,
                text: 'Backspace',
                icon: Icons.backspace,
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '7',
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '8',
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '9',
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorDark,
                foregroundColor: Theme.of(context).primaryColorLight,
                text: '/',
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '4',
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '5',
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '6',
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorDark,
                foregroundColor: Theme.of(context).primaryColorLight,
                text: 'X',
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '1',
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '2',
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '3',
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorDark,
                foregroundColor: Theme.of(context).primaryColorLight,
                text: '-',
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '0',
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '.',
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorLight,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '=',
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorDark,
                foregroundColor: Theme.of(context).primaryColorLight,
                text: '+',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final String text;
  IconData? icon;

  CalculatorButton({
    required this.backgroundColor,
    required this.foregroundColor,
    required this.text,
  });

  CalculatorButton.Icon({
    required this.backgroundColor,
    required this.foregroundColor,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Center(
        child: icon == null
            ? Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: foregroundColor),
              )
            : Icon(
                icon,
                color: foregroundColor,
              ),
      ),
    );
  }
}
