import 'package:app_performance/src/opacity/opacity_widget.dart';
import 'package:flutter/material.dart';

class OpacityAnimated extends StatefulWidget {
  const OpacityAnimated({super.key});

  @override
  State<OpacityAnimated> createState() => _OpacityAnimatedState();
}

class _OpacityAnimatedState extends State<OpacityAnimated>
    with TickerProviderStateMixin {
  late final _animation = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
  );

  late final _pageController = PageController();

  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    _animation.repeat(reverse: true);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: PageView.builder(
        onPageChanged: (pageIndex) {
          if (pageIndex == 2) {
            _isVisible = !_isVisible;
            setState(() {});
          }
        },
        controller: _pageController,
        itemBuilder: (context, index) {
          switch (index) {
            case 0:
              return Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    const Text(
                      "AnimatedBuilder",
                      style: TextStyle(fontSize: 24),
                    ),
                    const SizedBox(height: 20),
                    AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) => OpacityWidget(
                        opacity: _animation.value,
                      ),
                    ),
                  ],
                ),
              );
            case 1:
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text(
                      "FadeTransition",
                      style: TextStyle(fontSize: 24),
                    ),
                    const SizedBox(height: 20),
                    FadeTransition(
                      opacity: _animation,
                      child: Container(
                        color: Colors.red,
                        child: Image.asset('images/casper.jpg'),
                      ),
                    ),
                  ],
                ),
              );
            case 2:
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text(
                      "AnimatedOpacity",
                      style: TextStyle(fontSize: 24),
                    ),
                    const SizedBox(height: 20),
                    AnimatedOpacity(
                      opacity: _isVisible ? 1 : 0,
                      duration: const Duration(seconds: 3),
                      child: Container(
                        color: Colors.red,
                        child: Image.asset('images/casper.jpg'),
                      ),
                      onEnd: () {
                        setState(() {
                          _isVisible = !_isVisible;
                        });
                      },
                    ),
                  ],
                ),
              );
            default:
              return const SizedBox.shrink();
          }
        },
        itemCount: 3,
      ),
    );
  }
}

class CustomAnimatedOpacity extends ImplicitlyAnimatedWidget {
  const CustomAnimatedOpacity({
    super.key,
    this.child,
    required this.opacity,
    super.curve,
    required super.duration,
    super.onEnd,
    this.alwaysIncludeSemantics = false,
  }) : assert(opacity >= 0.0 && opacity <= 1.0);
  final Widget? child;
  final double opacity;
  final bool alwaysIncludeSemantics;

  @override
  ImplicitlyAnimatedWidgetState<AnimatedOpacity> createState() =>
      _CustomAnimatedOpacityState();
}

class _CustomAnimatedOpacityState
    extends ImplicitlyAnimatedWidgetState<AnimatedOpacity> {
  Tween<double>? _opacity;
  late Animation<double> _opacityAnimation;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _opacity = visitor(_opacity, widget.opacity,
            (dynamic value) => Tween<double>(begin: value as double))
        as Tween<double>?;
  }

  @override
  void didUpdateTweens() {
    _opacityAnimation = animation.drive(_opacity!);
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacityAnimation,
      alwaysIncludeSemantics: widget.alwaysIncludeSemantics,
      child: widget.child,
    );
  }
}
