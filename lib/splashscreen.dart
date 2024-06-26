import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_app/login_signup.dart';


class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: 'assets/videos/LOGO_VIDEO-ezgif.com-optimize.gif', 
      splashIconSize: 50000.0,
      nextScreen:     LoginSignupScreen(),
      backgroundColor: Colors.black,
      duration: 10000
      
      ),
    );
  }
}