import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/Api%20Integration/Base_url.dart';
import 'package:task_manager/Screen/AccountManagment/signIn.dart';

import '../../util/textFieldErrorCheck.dart';
import '../Widget/main_bg_sceen.dart';
import 'Forget_password/pinveritication.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  static const String name = "/sign-up";

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? _emailError;
  String? _FirstNameError;
  String? _LastNameError;
  String? _NumberError;
  String? _PasswordError;
  bool _isLoading = false;

  final TextFieldErrorCheck _validator = TextFieldErrorCheck();

  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _firstNamecontroller = TextEditingController();
  final TextEditingController _lastNamecontroller = TextEditingController();
  final TextEditingController _numbercontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 40,
                  ),
                  child: Form(
                    key: _formkey,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 40),

                        Text(
                          "Join With Us",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        SizedBox(height: 20),

                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailcontroller,
                          onChanged: (value) {
                            _emailError = _validator.validate(value, "email");
                            setState(() {});
                          },

                          decoration: InputDecoration(
                            hintText: "Email",
                            errorText: _emailError,
                          ),
                        ),

                        SizedBox(height: 20),

                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: _firstNamecontroller,
                          onChanged: (value) {
                            _FirstNameError = _validator.validate(
                              value,
                              "firstname",
                            );
                            setState(() {});
                          },
                          decoration: InputDecoration(
                            hintText: "First Name",
                            errorText: _FirstNameError,
                          ),
                        ),

                        SizedBox(height: 20),

                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: _lastNamecontroller,
                          onChanged: (value) {
                            _LastNameError = _validator.validate(
                              value,
                              "lastname",
                            );
                            setState(() {});
                          },
                          decoration: InputDecoration(
                            hintText: "Last Name",
                            errorText: _LastNameError,
                          ),
                        ),

                        SizedBox(height: 20),

                        TextFormField(
                          keyboardType: TextInputType.phone,
                          controller: _numbercontroller,

                          onChanged: (value) {
                            _NumberError = _validator.validate(value, "number");
                            setState(() {});
                          },
                          decoration: InputDecoration(
                            hintText: "Number",
                            errorText: _NumberError,
                          ),
                        ),

                        SizedBox(height: 20),

                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: _passwordcontroller,

                          onChanged: (value) {
                            _PasswordError = _validator.validate(
                              value,
                              "password",
                            );
                            setState(() {});
                          },
                          decoration: InputDecoration(
                            hintText: "Password",
                            errorText: _PasswordError,
                          ),
                        ),

                        SizedBox(height: 20),

                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(8),
                            ),
                            fixedSize: const Size.fromWidth(double.maxFinite),
                          ),

                          onPressed: () {
                            _nullCheckAndButtonClick();
                          },
                          child: Icon(Icons.navigate_next, color: Colors.white),
                        ),

                        SizedBox(height: 40),

                        Center(
                          child: RichText(
                            text: TextSpan(
                              text: "Have an account? ",
                              style: const TextStyle(color: Colors.black54),
                              children: [
                                TextSpan(
                                  text: "Sign In",
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        SingIn.name,
                                        (Route<dynamic> route) => false,
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
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailcontroller.dispose();
    _firstNamecontroller.dispose();
    _lastNamecontroller.dispose();
    _numbercontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  void _nullCheckAndButtonClick() {
    _emailError = _validator.validate(_emailcontroller.text, "email");
    _FirstNameError = _validator.validate(
      _firstNamecontroller.text,
      "firstname",
    );
    _LastNameError = _validator.validate(_lastNamecontroller.text, "lastname");
    _NumberError = _validator.validate(_numbercontroller.text, "number");
    _PasswordError = _validator.validate(_passwordcontroller.text, "password");
    setState(() {});

    // সব valid কিনা check
    if (_emailError == null &&
        _FirstNameError == null &&
        _LastNameError == null &&
        _NumberError == null &&
        _PasswordError == null) {
      RegisterSendCode();
    }
  }


  Future<void> saveSharedPreferences(String email, String firstname, String lastName, String number, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_email', email);
    await prefs.setString('user_firstname', firstname);
    await prefs.setString('user_lastname', lastName);
    await prefs.setString('user_number', number);
    await prefs.setString('user_password', password);
  }


  void RegisterSendCode() async {
    String _firstnameS = _firstNamecontroller.text.trim();
    String _lastNameS = _lastNamecontroller.text.trim();
    String _emailS = _emailcontroller.text.trim();
    String _numberS = _numbercontroller.text.trim();
    String _passwordS = _passwordcontroller.text.trim();

    final dio = Dio(
      BaseOptions(
        baseUrl: BaseUrl().BASEURL,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
      ),
    );

    Map<String, String> body = {
      "firstname": _firstnameS,
      "lastname": _lastNameS,
      "email": _emailS,
      "mobile": _numberS,
      "password": _passwordS,
      "password_confirmation": _passwordS,
    };

    try {
      Response response = await dio.post(
        BaseUrl().REGISTER_SEND_CODE_URL,
        data: body,

      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // JSON response
        var res = response.data;

        String status = res['status'];
        String? message = response.data?['message'];
        String displayMessage = message ?? "No message";


        print(status);
        print(displayMessage);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(displayMessage),
            duration: const Duration(seconds: 1),
          ),
        );

        saveSharedPreferences(_emailS, _firstnameS, _lastNameS, _numberS, _passwordS);

        Navigator.pushNamed(context, PinVerification.name);




      } else {
        print("Error: ${response.statusCode}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: ${response.statusCode}")),
        );
      }
    } catch (e) {
      print("Exception: $e");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Exception: $e")));
    }
  }
}
