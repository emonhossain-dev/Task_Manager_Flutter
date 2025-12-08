import 'package:flutter/material.dart';
import 'package:task_manager/Screen/AccountManagment/Forget_password/forgetByEmail.dart';
import 'package:task_manager/Screen/AccountManagment/Forget_password/pinveritication.dart';
import 'package:task_manager/Screen/AccountManagment/Forget_password/setPassword.dart';
import 'package:task_manager/Screen/AccountManagment/signUp.dart';
import 'package:task_manager/Screen/MainScreen/addnewdata.dart';

import '../Screen/AccountManagment/signIn.dart';
import '../Screen/MainScreen/homepage.dart';
import '../Screen/sp_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",

      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          hintStyle: TextStyle(
            color: Colors.grey
          ),

        ),

        appBarTheme: AppBarTheme(
          backgroundColor: Colors.green,
        )

      ),





      onGenerateRoute: (RouteSettings settings){
        late Widget widget;
        if(settings.name == SplashScreen.name) {
          widget = SplashScreen();
        } else if(settings.name == Homepage.name){
          widget = Homepage();
        } else if(settings.name == SingIn.name){
          widget = SingIn();
        } else if(settings.name == SignUp.name){
          widget = SignUp();
        } else if(settings.name == ForgetByEmail.name){
          widget = ForgetByEmail();
        } else if(settings.name == PinVerification.name){
          widget = PinVerification();
        } else if(settings.name == SetPassword.name){
          widget = SetPassword();
        } else if(settings.name == Homepage.name){
          widget = SetPassword();
        } else if(settings.name == AddNewData.name){
          widget = AddNewData();
        }

        return MaterialPageRoute(builder: (_)=>widget);

      },




    );
  }
}