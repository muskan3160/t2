import 'package:flutter/material.dart';
class OnboardingPage extends StatelessWidget {
  ...
  final Animation<Offset> lightCardOffsetAnimation;
  final Animation<Offset> darkCardOffsetAnimation;
  ...

  const OnboardingPage({
  ...
  @required this.lightCardOffsetAnimation,
  @required this.darkCardOffsetAnimation,
  ...,
  })  : ...,
  assert(lightCardOffsetAnimation != null),
  assert(darkCardOffsetAnimation != null),
  ...;

  @override
  Widget build(BuildContext context) {
  return Column(
  children: <Widget>[
  CardsStack(
  pageNumber: number,
  lightCardChild: lightCardChild,
  darkCardChild: darkCardChild,
  lightCardOffsetAnimation: lightCardOffsetAnimation,
  darkCardOffsetAnimation: darkCardOffsetAnimation,
  ),
  ...
  ],
  );
  }
