import 'package:flutter/material.dart';

class MyLoopAnimation {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  MyLoopAnimation(TickerProvider vsync) {
    _controller = AnimationController(
      duration: Duration(seconds: 5),
      vsync: vsync,
    )..repeat();

    _animation = Tween<Offset>(
      begin: Offset(-.2, 0),
      end: Offset(1, 0),
    ).animate(_controller);
  }

  AnimationController get controller => _controller;
  Animation<Offset> get animation => _animation;
}
