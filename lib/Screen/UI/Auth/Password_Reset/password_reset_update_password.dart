import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/Screen/UI/Auth/Password_Reset/password_reset_otp_pin_verification.dart';
import 'package:task_manager/Screen/UI/Auth/login_screen.dart';

import '../../../../Utils/appColors.dart';
import '../../../Widget/backgroud_widget.dart';

class PasswordResetUpdatePassword extends StatefulWidget {
  const PasswordResetUpdatePassword({super.key});


  static const String routeName = '/password_reset_update_password';


  @override
  State<PasswordResetUpdatePassword> createState() => _PasswordResetUpdatePasswordState();
}

class _PasswordResetUpdatePasswordState extends State<PasswordResetUpdatePassword> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController = TextEditingController();



  @override
  Widget build(BuildContext context) {

    final _textTheme = Theme.of(context).textTheme;


    return Scaffold(
      body: Background_Screen(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 100),
                    Text("Set Password", style: _textTheme.titleLarge),
                    SizedBox(height: 20),
                    Text("Minimum leangth password 8 charector with Letter and Number combination", style: _textTheme.titleSmall),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _passwordController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(hintText: "Password"),
                      keyboardType: TextInputType.emailAddress,

                      validator: (value) {

                        if (value == null || value.isEmpty) {
                          return "Please enter your Password";
                        }

                        return null;


                      },

                    ),
                    SizedBox(height: 20),TextFormField(
                      controller: _confirmpasswordController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(hintText: "Confirm Password"),
                      keyboardType: TextInputType.emailAddress,

                      validator: (value) {

                        if (value == null || value.isEmpty) {
                          return "Please enter your Confirm Password";
                        }

                        return null;


                      },

                    ),
                    SizedBox(height: 20),


                    ElevatedButton(
                      onPressed: () {

                        if (_formKey.currentState!.validate()) {

                          Navigator.pushNamed(context, SingIn.routeName);

                        }


                      },
                      child: Icon(Icons.arrow_circle_right_outlined),

                    ),

                    SizedBox(height: 20),


                    Center(
                      child: RichText(text: TextSpan(
                          text: "Have an account? ",
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                                text: "Sign In",
                                style: TextStyle(color: AppColors.app_color, fontWeight: FontWeight.bold ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamedAndRemoveUntil(context, SingIn.routeName, (route) => false);
                                  }),
                          ]

                      )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );;
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
  }


}
