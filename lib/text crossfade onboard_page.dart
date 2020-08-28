import 'package:flutter/material.dart';
class OnboardingPage extends StatelessWidget {
  ...

  @override
  Widget build(BuildContext context) {
  return Column(
  children: <Widget>[
  ...
  AnimatedSwitcher(
  duration: kCardAnimationDuration,
  child: textColumn,
  ),
  ],
  );
  }
}