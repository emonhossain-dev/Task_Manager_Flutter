import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/Screen/UI/Auth/Password_Reset/password_reset_otp_pin_verification.dart';
import 'package:task_manager/Screen/UI/Auth/login_screen.dart';

import '../../../../Utils/appColors.dart';
import '../../../Widget/backgroud_widget.dart';

class PasswordResetEmailVerification extends StatefulWidget {
  const PasswordResetEmailVerification({super.key});


  static const String routeName = '/password_reset_email_verification';


  @override
  State<PasswordResetEmailVerification> createState() => _PasswordResetEmailVerificationState();
}

class _PasswordResetEmailVerificationState extends State<PasswordResetEmailVerification> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();



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
                    Text("Your Email Address ", style: _textTheme.titleLarge),
                    SizedBox(height: 20),
                    Text("A 6 digit verification pin will been sent to your email address", style: _textTheme.titleSmall),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _emailController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(hintText: "Email"),
                      keyboardType: TextInputType.emailAddress,

                      validator: (value) {

                        if (value == null || value.isEmpty) {
                          return "Please enter your email";
                        }

                        return null;


                      },

                    ),
                    SizedBox(height: 20),


                    ElevatedButton(
                      onPressed: () {

                        if (_formKey.currentState!.validate()) {

                          Navigator.pushNamed(context, PasswordResetOtpPinVerification.routeName);

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
    _emailController.dispose();
  }


}
