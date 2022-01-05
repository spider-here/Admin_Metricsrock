import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'login.dart';

class splash extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).backgroundColor,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: AnimatedSplashScreen(
        splash: Image.asset("assets/images/metricsrock_logo.png",
          width: 400.0,),
        nextScreen: login(),
        splashTransition: SplashTransition.fadeTransition,
        centered: true,
        animationDuration: Duration(milliseconds: 800),
        duration: 2000,
      ),
    );
  }

}