import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/Screen/AccountManagment/Forget_password/forgetByEmail.dart';
import 'package:task_manager/Screen/AccountManagment/signUp.dart';
import 'package:task_manager/Screen/MainScreen/homepage.dart';

import '../../util/textFieldErrorCheck.dart';
import '../Widget/main_bg_sceen.dart';

class SingIn extends StatefulWidget {
  const SingIn({super.key});
  static const String name = "/sign-in";

  @override
  State<SingIn> createState() => _SignInState();
}

class _SignInState extends State<SingIn> {


  String? _emailError;
  String? _PasswordError;

  final TextFieldErrorCheck _validator = TextFieldErrorCheck();



  final TextEditingController _emailControllers = TextEditingController();
  final TextEditingController _passwordControllers = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BackgroundScreen(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 40),
                        Text(
                          "Get Started With",
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _emailControllers,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            _emailError = _validator.validate(value, "email");
                            setState(() {
                            });
                          },
                          decoration: InputDecoration(
                            hintText: "Email",
                            errorText: _emailError,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.8),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _passwordControllers,
                          keyboardType: TextInputType.text,
                          onChanged: (value) {
                            _PasswordError = _validator.validate(value, "password");
                            setState(() {
                            });
                          },
                          decoration: InputDecoration(
                            hintText: "Password",
                            errorText: _PasswordError,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.8),
                          ),
                          obscureText: true,
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            minimumSize: Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            _nullCheckAndButtonClick();
                          },
                          child: Icon(Icons.navigate_next, color: Colors.white),
                        ),
                        SizedBox(height: 40),
                        Center(
                          child: Column(
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, ForgetByEmail.name);
                                },
                                child: Text("Forget Password ?", style: TextStyle(color: Colors.grey)),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: "Don't have an account? ",
                                  style: TextStyle(color: Colors.black54),
                                  children: [
                                    TextSpan(
                                      text: "Sign Up",
                                      style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.pushNamedAndRemoveUntil(context, SignUp.name, (_) => false);
                                        },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailControllers.dispose();
    _passwordControllers.dispose();
    super.dispose();
  }


  void _nullCheckAndButtonClick() {
    setState(() {
      _emailError = _validator.validate(_emailControllers.text, "email");
      _PasswordError = _validator.validate(_passwordControllers.text, "password");
    });

    if (_emailError == null && _PasswordError == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("OKAY"), backgroundColor: Colors.green),
      );
    }
  }

  /// More examples see https://github.com/cfug/dio/tree/main/dio#examples
  void _logingRequest() async {
    final dio = Dio();

    Map<String,String> header = {
      "Authorization": "Bearer ",
      "Content-Type": "application/json",
    };

    Map<String, dynamic> body = {

    };



  }


}
