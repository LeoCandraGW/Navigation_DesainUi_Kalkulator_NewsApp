import 'package:flutter/material.dart';

class UiScreen extends StatefulWidget {
  @override
  _UiScreenState createState() => _UiScreenState();
}

class _UiScreenState extends State<UiScreen> {
  final double boxSize = 150.0;
  int numTaps = 0;
  int numDoubleTaps = 0;
  int numLongpress = 0;
  double posX = 0.0;
  double posY = 0.0;

  void center(BuildContext context) {
    posX = (MediaQuery.of(context).size.width / 2) - boxSize / 2;
    posY = (MediaQuery.of(context).size.height / 2) - boxSize / 2 - 30;
    setState(() {
      this.posX = posX;
      this.posY = posY;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (posX == 0) {
      center(context);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Gesture Detector'),
      ),
      body: Stack(
        children: [
          Positioned(
            top: posY,
            left: posX,
            child: GestureDetector(
              child: Container(
                width: boxSize,
                height: boxSize,
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
              ),
              onTap: () {
                setState(() {
                  numTaps++;
                });
              },
              onDoubleTap: () {
                setState(() {
                  numDoubleTaps++;
                });
              },
              onLongPress: () {
                setState(() {
                  numLongpress++;
                });
              },
              onPanUpdate: (DragUpdateDetails details) {
                setState(() {
                  double deltaX = details.delta.dx;
                  double deltaY = details.delta.dy;
                  posX += deltaX;
                  posY += deltaY;
                });
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.yellow,
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Taps: $numTaps - Double Taps: $numDoubleTaps - Long Press: $numLongpress',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
