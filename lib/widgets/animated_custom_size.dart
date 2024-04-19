import 'package:flutter/material.dart';

class AnimatedCustomSizeWidget extends StatefulWidget {
  const AnimatedCustomSizeWidget({Key? key}) : super(key: key);

  @override
  State<AnimatedCustomSizeWidget> createState() =>
      _AnimatedCustomSizeWidgetState();
}

class _AnimatedCustomSizeWidgetState extends State<AnimatedCustomSizeWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation sizeAnimation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    sizeAnimation =
        Tween<double>(begin: 200, end: 60).animate(animationController);
    animationController.addListener(() {
      setState(() {});
    });
    animationController.forward();
  }

  bool isValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedContainer')),
      body: Column(
        children: [
          TextButton(
            child: const Text('Text'),
            onPressed: () {
              setState(() {
                if (isValid) {
                  animationController.forward();
                } else {
                  animationController.reverse();
                }
                isValid = !isValid;
              });
            },
          ),
          Container(
            color: Colors.red,
            width: sizeAnimation.value,
            // width: isValid ? sizeAnimation.value : 200,
            child: const Text('Teste'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }
}
