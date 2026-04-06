import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Utils/pathclass.dart';
import '../Widget/backgroud_widget.dart';
import 'Auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();

  static const String routeName = '/splash';
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _moveTotheNextScreen();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background_Screen(
            child: Center(
              child: SvgPicture.asset(
                PathClass.logo,
                width: 50,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }


  Future<void> _moveTotheNextScreen() async {

    await Future.delayed(Duration(seconds: 2));
    Navigator.pushNamedAndRemoveUntil(context, SingIn.routeName, (route) => false);


  }




}
