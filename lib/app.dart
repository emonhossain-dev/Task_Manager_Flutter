import 'package:flutter/material.dart';
import 'package:task_manager/Screen/UI/Auth/Password_Reset/password_reset_otp_pin_verification.dart';
import 'package:task_manager/Screen/UI/Auth/Password_Reset/password_reset_update_password.dart';
import 'package:task_manager/Screen/UI/Auth/login_screen.dart';
import 'package:task_manager/Screen/UI/splash_screen.dart';

import 'Screen/UI/Auth/Password_Reset/password_reset_email_verification.dart';
import 'Screen/UI/Auth/registration_screen.dart';
import 'Screen/UI/Main_Screen/insert_task.dart';
import 'Screen/UI/Main_Screen/update_screen.dart';
import 'Screen/UI/bottom_nav.dart';
import 'Utils/appColors.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        debugShowCheckedModeBanner: false,

      theme: ThemeData(

        textTheme: TextTheme(
          titleLarge: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          )
        ),
        inputDecorationTheme:InputDecorationTheme(
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
          hintStyle: TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
          border: OutlineInputBorder(borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,

        ),


        elevatedButtonTheme: ElevatedButtonThemeData(

          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.app_color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            fixedSize: Size.fromWidth(double.maxFinite),
            padding: EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 16,
            ),
            foregroundColor: Colors.white,
            textStyle: TextStyle(
              fontSize: 16,
            )
          ),
        ),



      ),



     initialRoute: SplashScreen.routeName,
      onGenerateRoute: (RouteSettings settings) {

       late Widget widget;
       
       if (settings.name == SplashScreen.routeName) {
         widget = const SplashScreen();
       } else if (settings.name == SingIn.routeName) {
         widget = const SingIn();
       } else if (settings.name == RegistrationScreen.routeName) {
         widget = const RegistrationScreen();
       } else if (settings.name == PasswordResetEmailVerification.routeName) {
         widget = const PasswordResetEmailVerification();
       } else if (settings.name == PasswordResetOtpPinVerification.routeName) {
         widget = const PasswordResetOtpPinVerification();
       } else if (settings.name == PasswordResetUpdatePassword.routeName) {
         widget = const PasswordResetUpdatePassword();
       } else if (settings.name == BottomNav.routeName) {
         widget = const BottomNav();
       } else if (settings.name == UpdateScreen.routeName) {
         widget = const UpdateScreen();
       } else if (settings.name == InsertTask.routeName) {
         widget = const InsertTask();
       }
       
       return MaterialPageRoute(builder: (_) => widget);
       
       
       
      }
      
      
      
      
      
    );
  }
}