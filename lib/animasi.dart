
import 'package:flutter/material.dart';
import 'dart:math';

class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> 
 with SingleTickerProviderStateMixin{
  bool _isBig = false;
  double _size = 100.0;

  Tween<double> _animationTween = Tween(begin: 0, end: pi * 2);
  // Tween _colorTween = ColorTween(begin: Colors.blue, end: Colors.purple);

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animations'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(seconds: 1),
              color: Colors.blue,
              height: _size,
              width: _size,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _size = _isBig ? 200 : 100;
                  _isBig = !_isBig;
                });
              },
              child: Text('Animate'),
            ),
            TweenAnimationBuilder(
              tween: _animationTween,
              duration: Duration(seconds: 10),
              builder: (context, double value, child) {
                return Transform.rotate(
                  angle: value,
                  child: Container(
                    color: Colors.blue,
                    height: _size,
                    width: _size,
                  ),
                );
              },
            ),

            // Eror
            // TweenAnimationBuilder<Color>(
            //   tween: Tween<Color>(begin: Colors.blue, end: Colors.purple),
            //   duration: Duration(seconds: 3),
            //   builder: (context, Color value, child) {
            //     return Container(
            //       color: value,
            //       height: _size,
            //       width: _size,
            //     );
            //   },
            // ),

            RotationTransition(
              turns: _controller,
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: FlutterLogo(
                  size: 100,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
