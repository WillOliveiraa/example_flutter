import 'package:flutter/material.dart';

import 'widgets/animated_list.dart';
import 'widgets/animated_padding.dart';
import 'widgets/animated_positioned.dart';
import 'widgets/animated_alignment.dart';
import 'widgets/animated_container.dart';
import 'widgets/local_auth_invisible.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AnimatedListWidget()),
                  );
                },
                child: const Text('AnimatedListView'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LocalAuthInvisible()),
                  );
                },
                child: const Text('LocalAuthInvisible'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AnimatedPositionedWidget()),
                  );
                },
                child: const Text('AnimatedPositioned'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AnimatedPaddingWidget()),
                  );
                },
                child: const Text('AnimatedPadding'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AnimatedAlignmentWidget()),
                  );
                },
                child: const Text('AnimatedAlignment'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AnimatedContainerWidget()),
                  );
                },
                child: const Text('AnimatedContainer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
