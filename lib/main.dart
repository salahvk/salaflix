import 'package:flutter/material.dart';
import 'package:salafix/components/theme_manager.dart';
import 'package:salafix/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Salafix',
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(context).copyWith(useMaterial3: true),
      home: const HomePage(),
    );
  }
}
