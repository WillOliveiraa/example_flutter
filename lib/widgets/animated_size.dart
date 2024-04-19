import 'package:flutter/material.dart';

class AnimatedSizeWidget extends StatefulWidget {
  const AnimatedSizeWidget({Key? key}) : super(key: key);

  @override
  State<AnimatedSizeWidget> createState() => _AnimatedSizeWidgetState();
}

class _AnimatedSizeWidgetState extends State<AnimatedSizeWidget> {
  double size = 300;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedContainer')),
      body: GestureDetector(
        onTap: () => setState(() => size = size == 300 ? 100 : 300),
        child: Container(
          color: Colors.white,
          child: AnimatedSize(
            duration: const Duration(seconds: 1),
            curve: Curves.easeIn,
            child: FlutterLogo(size: size),
          ),
        ),
      ),
    );
  }
}
