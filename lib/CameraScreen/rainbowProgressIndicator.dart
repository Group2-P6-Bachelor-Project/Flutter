import 'package:flutter/material.dart';

class RainbowProgressIndicator extends StatefulWidget {
  const RainbowProgressIndicator({Key? key}) : super(key: key);

  @override
  _RainbowProgressIndicatorState createState() =>
      _RainbowProgressIndicatorState();
}

class _RainbowProgressIndicatorState extends State<RainbowProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget? child) {
        return CircularProgressIndicator(
          strokeWidth: 8,
          valueColor: TweenSequence<Color?>(
            [
              TweenSequenceItem(
                weight: 1.0,
                tween: ColorTween(
                  begin: Colors.red,
                  end: Colors.orange,
                ),
              ),
              TweenSequenceItem(
                weight: 1.0,
                tween: ColorTween(
                  begin: Colors.orange,
                  end: Colors.yellow,
                ),
              ),
              TweenSequenceItem(
                weight: 1.0,
                tween: ColorTween(
                  begin: Colors.yellow,
                  end: Colors.green,
                ),
              ),
              TweenSequenceItem(
                weight: 1.0,
                tween: ColorTween(
                  begin: Colors.green,
                  end: Colors.blue,
                ),
              ),
              TweenSequenceItem(
                weight: 1.0,
                tween: ColorTween(
                  begin: Colors.blue,
                  end: Colors.indigo,
                ),
              ),
              TweenSequenceItem(
                weight: 1.0,
                tween: ColorTween(
                  begin: Colors.indigo,
                  end: Colors.purple,
                ),
              ),
              TweenSequenceItem(
                weight: 1.0,
                tween: ColorTween(
                  begin: Colors.purple,
                  end: Colors.red,
                ),
              ),
            ],
          ).animate(_animationController),
        );
      },
    );
  }
}
