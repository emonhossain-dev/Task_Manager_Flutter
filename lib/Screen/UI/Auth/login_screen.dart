import 'package:flutter/material.dart';
import 'package:task_manager/Screen/Widget/backgroud_widget.dart';
import 'package:task_manager/Utils/appColors.dart';

class SingIn extends StatefulWidget {
  const SingIn({super.key});

  @override
  State<SingIn> createState() => _SingInState();

  static const String routeName = '/singin';
}

class _SingInState extends State<SingIn> {
  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Background_Screen(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 100),
                  Text("Get Started With", style: _textTheme.titleLarge),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(hintText: "Email"),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(hintText: "Password"),
                  ),
                  SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () {},
                    child: Icon(Icons.arrow_circle_right_outlined),

                  ),

                  SizedBox(height: 20),

                  Center(
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text("Forgot Password?", style: TextStyle(color: Colors.grey),),
                        ),
                        
                        RichText(text: TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: "Sign Up",
                              style: TextStyle(color: AppColors.app_color, fontWeight: FontWeight.bold ),
                            )
                          ]

                        ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
