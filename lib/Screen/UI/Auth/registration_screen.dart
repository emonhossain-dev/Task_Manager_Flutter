import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/Screen/UI/Auth/login_screen.dart';

import '../../../Utils/appColors.dart';
import '../../Widget/backgroud_widget.dart';
import 'Password_Reset/password_reset_email_verification.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  static const String routeName = '/registration';

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {


  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme
        .of(context)
        .textTheme;
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
                    Text("Join With Us", style: _textTheme.titleLarge),
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
                      controller: _firstNameController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(hintText: "First Name"),
                      keyboardType: TextInputType.emailAddress,

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your First Name";
                        }

                        return null;
                      },

                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _lastNameController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(hintText: "Last Name"),
                      keyboardType: TextInputType.emailAddress,

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your Last Name";
                        }

                        return null;
                      },

                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _mobileNumberController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(hintText: "Mobile Number"),
                      keyboardType: TextInputType.emailAddress,

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your Mobile Number";
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

                        }
                      },


                      child: Icon(Icons.arrow_circle_right_outlined),
                    ),

                    SizedBox(height: 20),

                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: "I have an account? ",
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: "Sign In",
                              style: TextStyle(
                                color: AppColors.app_color,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    SingIn.routeName,
                                        (route) => false,
                                  );
                                },
                            ),
                          ],
                        ),
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

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _mobileNumberController.dispose();
    _passwordController.dispose();
  }
}
