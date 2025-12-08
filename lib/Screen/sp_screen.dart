import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'AccountManagment/signIn.dart';
import 'Widget/applogo.dart';
import 'Widget/main_bg_sceen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});


  static const String name = "/";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gotonextpage();
  }


  Future<void> gotonextpage() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacementNamed(context, SingIn.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: BackgroundScreen(
        child: Center(
            child: AppLogo()
        ),
      )



      ,
    );
  }
}


