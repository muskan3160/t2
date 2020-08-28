import 'package:flutter/material.dart';
class Onboarding extends StatefulWidget {
  final double screenHeight;

  const Onboarding({
    @required this.screenHeight,
  }) : assert(screenHeight != null);

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> with TickerProviderStateMixin {
  ...
  AnimationController _rippleAnimationController;

  ...
  Animation<double> _rippleAnimation;

  ...

  @override
  void initState() {
  super.initState();
  ...
  _rippleAnimationController = AnimationController(
  vsync: this,
  duration: kRippleAnimationDuration,
  );

  _rippleAnimation = Tween<double>(
  begin: 0.0,
  end: widget.screenHeight,
  ).animate(CurvedAnimation(
  parent: _rippleAnimationController,
  curve: Curves.easeIn,
  ));

  ...
  }

  @override
  void dispose() {
  ...
  _rippleAnimationController.dispose();
  super.dispose();
  }

  Future<void> _nextPage() async {
  switch (_currentPage) {
  ...
  case 3:
  if (_pageIndicatorAnimation.status == AnimationStatus.completed) {
  await _goToLogin();
  }
  break;
  }
  }

  Future<void> _goToLogin() async {
  await _rippleAnimationController.forward();
  Navigator.of(context).push(
  MaterialPageRoute(
  builder: (_) => Login(
  screenHeight: widget.screenHeight,
  ),
  ),
  );
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
  backgroundColor: kBlue,
  body: Stack(
  children: <Widget>[
  SafeArea(
  child: Padding(
  padding: const EdgeInsets.all(kPaddingL),
  child: Column(
  children: <Widget>[
  Header(
  onSkip: () async => await _goToLogin(),
  ),
  Expanded(
  child: _getPage(),
  ),
  AnimatedBuilder(
  animation: _pageIndicatorAnimation,
  child: NextPageButton(
  onPressed: () async => await _nextPage(),
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
  AnimatedBuilder(
  animation: _rippleAnimation,
  builder: (_, Widget child) {
  return Ripple(
  radius: _rippleAnimation.value,
  );
  },
  ),
  ],
  ),
  );
  }
}
