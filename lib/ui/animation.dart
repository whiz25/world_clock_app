import 'package:flutter/widgets.dart';
import 'dart:math' as math;

class MainAnimation {
  final AnimationController animationController;
  final Animation<double> dateAnimation;
  final Animation<double> iconAnimation;
  final Animation<double> timeAnimation;

  MainAnimation(this.animationController)
      : dateAnimation = Tween(begin: 0.0, end: 0.5).animate(
            CurvedAnimation(parent: animationController, curve: Curves.easeIn)),
        iconAnimation = Tween<double>(begin: 0.0, end: 2 * math.pi)
            .animate(animationController),
        timeAnimation = Tween(begin: 0.0, end: 0.5).animate(
            CurvedAnimation(parent: animationController, curve: Curves.easeIn));
}
