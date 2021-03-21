import 'package:flutter/material.dart';
import 'package:mirror/pages/home.dart';
import 'package:window_size/window_size.dart' as window_size;

void main() {
  runApp(LayoutBuilder(
    builder: (context, constraints) {
      window_size.setWindowMinSize(Size(1280, 720));
      window_size.setWindowTitle("Mirror Call");
      return OrientationBuilder(
        builder: (context, orientation) {
          return MyApp();
        },
      );
    },
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mirror Call',
      color: Colors.white,
      theme: new ThemeData(
        scaffoldBackgroundColor: const Color(0xFF1C1F2E),
        dividerTheme: DividerThemeData(color: Colors.grey.withOpacity(0.2)),
        textTheme: TextTheme(
          bodyText1: TextStyle(),
          bodyText2: TextStyle(),
        ).apply(
          bodyColor: Colors.white,
        )
      ),
      home: MyHomePage(title: 'Home'),
    );
  }
}

