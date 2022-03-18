import 'package:flutter/material.dart';

import 'feature/current_city/current_city_view.dart';
import 'feature/page_view/page_manager.dart';
import 'feature/search_view/search_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.transparent,
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.white, inherit: true),
            bodyMedium: TextStyle(color: Colors.white, inherit: true),
            bodySmall: TextStyle(color: Colors.white, inherit: true),
          ),
          iconTheme: const IconThemeData(
            color: Colors.white,
          )),
      debugShowCheckedModeBanner: false,
      home: PageManager(),
    );
  }
}
