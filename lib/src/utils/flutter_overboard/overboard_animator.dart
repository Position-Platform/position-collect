/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-09 14:35:10 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-09 14:46:50
 */
import 'package:flutter/widgets.dart';

class OverBoardAnimator {
  late TickerProvider _vsync;
  late AnimationController _controller;
  late Animation _animation;

  OverBoardAnimator(vsync) {
    _vsync = vsync;
    _controller = AnimationController(
        vsync: _vsync, duration: const Duration(milliseconds: 500));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    //print('creating new animator');
  }

  AnimationController getController() {
    return _controller;
  }

  Animation getAnimator() {
    return _animation;
  }

  dispose() {
    _controller.dispose();
  }
}
