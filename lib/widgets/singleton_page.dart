import 'package:flutter/material.dart';

class SingletonPage extends StatelessWidget {
  SingletonPage({Key? key}) : super(key: key);

  // final themeStore = ThemeStore.instance;
  final themeStore = ThemeStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Singleton')),
      body: Center(
        child: AnimatedBuilder(
          animation: themeStore,
          builder: (context, child) {
            return Switch(
              value: themeStore.isDarkTheme,
              onChanged: (value) => themeStore.switchTheme(),
            );
          },
        ),
      ),
    );
  }
}

class ThemeStore extends ChangeNotifier {
  // static final ThemeStore _instance = ThemeStore._();
  // static ThemeStore get instance => _instance;
  // ThemeStore._();

  static final ThemeStore _instance = ThemeStore._();
  ThemeStore._();
  factory ThemeStore() => ThemeStore._instance;

  ThemeMode _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;

  bool get isDarkTheme => _themeMode == ThemeMode.dark;

  void switchTheme() {
    _themeMode = isDarkTheme ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}
