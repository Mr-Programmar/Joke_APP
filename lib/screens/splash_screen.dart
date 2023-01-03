import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jok_app/screens/joke_screen.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    splashfun();
  }

  splashfun() {
    Future.delayed(Duration(seconds: 5), (){
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: ((context) => Joke())), (route) => false);
    });

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        decoration: BoxDecoration(color: Color(0xffFFC81B)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/new.png'),
            Lottie.asset(
              "assets/images/loading.json",
              fit: BoxFit.fill,
              height: 100,
              width: 100,
            ),
            Text(
              "Jokes it!",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 70,
                  color: Colors.white),
            ),
            Text(
              "Your daily Dose",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 15,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
