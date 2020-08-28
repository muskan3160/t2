import 'package:flutter/material.dart';
import 'onboarding.dart';
class CardsStack extends StatelessWidget {
  ...
  final Animation<Offset> lightCardOffsetAnimation;
  final Animation<Offset> darkCardOffsetAnimation;

  const CardsStack({
  ...
  @required this.lightCardOffsetAnimation,
  @required this.darkCardOffsetAnimation,
  })  : ...,
  assert(lightCardOffsetAnimation != null),
  assert(darkCardOffsetAnimation != null);

  ...

  @override
  Widget build(BuildContext context) {
  ...

  return Padding(
  padding: EdgeInsets.only(
  top: isOddPageNumber ? 25.0 : 50.0,
  ),
  child: Stack(
  alignment: AlignmentDirectional.center,
  overflow: Overflow.visible,
  children: <Widget>[
  SlideTransition(
  position: darkCardOffsetAnimation,
  child: Card(
  ...
  ),
  ),
  Positioned(
  top: !isOddPageNumber ? -25.0 : null,
  bottom: isOddPageNumber ? -25.0 : null,
  child: SlideTransition(
  position: lightCardOffsetAnimation,
  child: Card(
  ...
  ),
  ),
  ),
  ],
  ),
  );
  }
}
