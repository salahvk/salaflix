import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salafix/components/routes_manager.dart';
import 'package:salafix/components/theme_manager.dart';
import 'package:salafix/provider/data_provider.dart';
import 'package:salafix/provider/movie_details_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DataProvider()),
        ChangeNotifierProvider(create: (_) => MovieProvider())
      ],
      child: MaterialApp(
        title: 'Salaflix',
        debugShowCheckedModeBanner: false,
        theme: getApplicationTheme(context).copyWith(useMaterial3: true),
        initialRoute: Routes.splashRoute,
        onGenerateRoute: RouteGenerator.getRoute,
      ),
    );
  }
}
