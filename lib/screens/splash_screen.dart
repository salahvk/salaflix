import 'dart:async';

import 'package:flutter/material.dart';
import 'package:salafix/API/get_trending.dart';
import 'package:salafix/components/routes_manager.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    getTrending(context);
    Timer(Duration(seconds: 3), () {
      Navigator.pushNamed(context, Routes.homePage);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SizedBox(
          height: size.height / 6,
          width: size.height / 6,
          child: Image.asset("assets/salaflix.png"),
        ),
      ),
    );
  }
}
