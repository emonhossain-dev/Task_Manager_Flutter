import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/Screen/UI/Auth/registration_screen.dart';
import 'package:task_manager/Screen/UI/bottom_nav.dart';
import 'package:task_manager/Screen/Widget/backgroud_widget.dart';
import 'package:task_manager/Utils/appColors.dart';

import 'Password_Reset/password_reset_email_verification.dart';

class SingIn extends StatefulWidget {
  const SingIn({super.key});

  @override
  State<SingIn> createState() => _SingInState();

  static const String routeName = '/singin';
}

class _SingInState extends State<SingIn> {


  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


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
                    Text("Get Started With", style: _textTheme.titleLarge),
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
                    SizedBox(height: 20),

                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {

                          Navigator.pushReplacementNamed(context, BottomNav.routeName);

                        }


                      },


                      child: Icon(Icons.arrow_circle_right_outlined),

                    ),

                    SizedBox(height: 20),

                    Center(
                      child: Column(
                        children: [
                          TextButton(
                            onPressed: () {

                              Navigator.pushNamed(context, PasswordResetEmailVerification.routeName);

                            },
                            child: Text("Forgot Password?", style: TextStyle(color: Colors.grey),),
                          ),

                          RichText(text: TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                text: "Sign Up",
                                style: TextStyle(color: AppColors.app_color, fontWeight: FontWeight.bold ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushNamedAndRemoveUntil(context, RegistrationScreen.routeName, (route) => false);
                                    }

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
      ),
    );
  }

/*  Future<void> _LoginApiCalled() async{

    isRegisterInProcess= true;
    setState(() {
    });



    Map<String, dynamic> body = {

      "email":_emailController.text.trim(),
      "firstName":_firstNameController.text.trim(),
      "lastName":_lastNameController.text.trim(),
      "mobile":_mobileNumberController.text.trim(),
      "password":_mobileNumberController.text.trim(),

    };

    final NetworkResponse response = await NetworkCaller.PostRequest(BaseURL.register_URL, body);


    if(response.isSuccess) {
      _clearEditText();
      showSnackBarMessage(context, "Registration Successful");
      Navigator.pushNamedAndRemoveUntil(context, SingIn.routeName, (route) => false);

    } else {
      showSnackBarMessage(context, response.errorMessage ?? "Registration Failed");
    }

  }

  void _clearEditText(){

    _emailController.clear();
    _firstNameController.clear();
    _lastNameController.clear();
    _mobileNumberController.clear();
    _passwordController.clear();


  }*/


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }








}

