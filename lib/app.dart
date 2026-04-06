import 'package:flutter/material.dart';
import 'package:task_manager/Screen/UI/Auth/login_screen.dart';
import 'package:task_manager/Screen/UI/splash_screen.dart';

import 'Utils/appColors.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

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
       }
       
       return MaterialPageRoute(builder: (_) => widget);
       
       
       
      }
      
      
      
      
      
    );
  }
}