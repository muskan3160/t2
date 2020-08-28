import 'package:flutter/material.dart';
class _OnboardingState extends State<Onboarding> with TickerProviderStateMixin {
  ...
  AnimationController _pageIndicatorAnimationController;

  ...
  Animation<double> _pageIndicatorAnimation;

  ...

  @override
  void initState() {
  super.initState();
  ...
  _pageIndicatorAnimationController = AnimationController(
  vsync: this,
  duration: kButtonAnimationDuration,
  );

  _setPageIndicatorAnimation();
  ...
  }

  @override
  void dispose() {
  ...
  _pageIndicatorAnimationController.dispose();
  super.dispose();
  }

  ...

  void _setPageIndicatorAnimation({bool isClockwiseAnimation = true}) {
  var multiplicator = isClockwiseAnimation ? 2 : -2;

  setState(() {
  _pageIndicatorAnimation = Tween(
  begin: 0.0,
  end: multiplicator * pi,
  ).animate(
  CurvedAnimation(
  parent: _pageIndicatorAnimationController,
  curve: Curves.easeIn,
  ),
  );
  _pageIndicatorAnimationController.reset();
  });
  }

  ...

  void _nextPage() {
  switch (_currentPage) {
  case 1:
  if (_pageIndicatorAnimation.status == AnimationStatus.dismissed) {
  _pageIndicatorAnimationController.forward();
  await _cardsAnimationController.forward();
  _setNextPage(2);
  _setCardsSlideInAnimation();
  await _cardsAnimationController.forward();
  _setCardsSlideOutAnimation();
  _setPageIndicatorAnimation(isClockwiseAnimation: false);
  }
  break;
  case 2:
  if (_pageIndicatorAnimation.status == AnimationStatus.dismissed) {
  _pageIndicatorAnimationController.forward();
  await _cardsAnimationController.forward();
  _setNextPage(3);
  _setCardsSlideInAnimation();
  await _cardsAnimationController.forward();
  }
  break;
  case 3:
  if (_pageIndicatorAnimation.status == AnimationStatus.completed) {
  _goToLogin();
  }
  break;
  }
  }

  ...

  @override
  Widget build(BuildContext context) {
  return Scaffold(
  backgroundColor: kBlue,
  body: SafeArea(
  child: Padding(
  padding: const EdgeInsets.all(kPaddingL),
  child: Column(
  children: <Widget>[
  ...
  AnimatedBuilder(
  animation: _pageIndicatorAnimation,
  child: NextPageButton(
  onPressed: _nextPage,
  ),
  builder: (_, Widget child) {
  return OnboardingPageIndicator(
  angle: _pageIndicatorAnimation.value,
  currentPage: _currentPage,
  child: child,
  );
  },
  ),
  ],
  ),
  ),
  ),
  );
  }
}
