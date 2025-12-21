import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/Screen/MainScreen/homepage.dart';
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
    super.initState();
    checkTokenAndNavigate();
  }


  Future<void> checkTokenAndNavigate() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");

    if (token == null || token.isEmpty) {
      // Token নেই → Login page এ যাবে
      await Future.delayed(const Duration(seconds: 2));
      Navigator.pushReplacementNamed(context, SingIn.name);
    } else {
      // Token আছে → Homepage এ যাবে
      await Future.delayed(const Duration(seconds: 2));
      Navigator.pushReplacementNamed(context, Homepage.name);
    }
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


