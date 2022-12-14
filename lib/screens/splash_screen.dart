import 'package:flutter/material.dart';
import 'package:salafix/API/get_home_page.dart';
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
    gotoNextPage();
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

  gotoNextPage() async {
    await getTrending(context);
    await getPopular(context);
    await getUpcoming(context);
    await getTvPopular(context);
    await getTopRatedMovie(context);
    await getTopRatedTv(context);
    // Timer(Duration(seconds: 3), () {
    Navigator.pushReplacementNamed(context, Routes.homePage);
    // });
  }
}
