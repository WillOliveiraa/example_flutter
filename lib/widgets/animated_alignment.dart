import 'package:flutter/material.dart';

class AnimatedAlignmentWidget extends StatefulWidget {
  const AnimatedAlignmentWidget({Key? key}) : super(key: key);

  @override
  State<AnimatedAlignmentWidget> createState() =>
      _AnimatedAlignmentWidgetState();
}

class _AnimatedAlignmentWidgetState extends State<AnimatedAlignmentWidget> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedPadding')),
      body: GestureDetector(
        onTap: () => setState(() => selected = !selected),
        child: Center(
          child: Container(
            width: double.maxFinite,
            height: 250,
            color: Colors.blueGrey,
            child: AnimatedAlign(
              alignment: selected ? Alignment.topRight : Alignment.bottomLeft,
              duration: const Duration(seconds: 2),
              curve: Curves.fastOutSlowIn,
              child: const FlutterLogo(size: 50),
            ),
          ),
        ),
      ),
    );
  }
}
