import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager/Screen/UI/Auth/Password_Reset/password_reset_update_password.dart';
import 'package:task_manager/Screen/UI/Auth/login_screen.dart';

import '../../../../Utils/appColors.dart';
import '../../../Widget/backgroud_widget.dart';

class PasswordResetOtpPinVerification extends StatefulWidget {
  const PasswordResetOtpPinVerification({super.key});

  static const String routeName = '/password_reset_Otp_Pin_verification';

  @override
  State<PasswordResetOtpPinVerification> createState() =>
      _PasswordResetOtpPinVerificationState();
}

class _PasswordResetOtpPinVerificationState
    extends State<PasswordResetOtpPinVerification> {
  final _formKey = GlobalKey<FormState>();
  final _pinController = PinInputController();

  @override
  void initState() {
    super.initState();

    _pinController.addListener(() {
      if (_pinController.hasError) {
        _pinController.clearError();
        setState(() {}); // UI refresh
      }
    });
  }

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
                  Text("Pin Verification ", style: _textTheme.titleLarge),
                  SizedBox(height: 20),
                  Text(
                    "Minimum 6 digit pin is required",
                    style: _textTheme.titleSmall,
                  ),
                  SizedBox(height: 20),

                  Form(
                    key: _formKey,
                    child: Center(
                      child: MaterialPinFormField(
                        pinController: _pinController,
                        length: 6,
                        theme: MaterialPinTheme(
                          shape: MaterialPinShape.outlined,
                          cellSize: Size(56, 64),
                          spacing: 8,
                          borderRadius: BorderRadius.circular(12),

                          // Border
                          borderWidth: 1.5,
                          focusedBorderWidth: 2.0,
                          borderColor: Colors.grey,
                          focusedBorderColor: Colors.blue,
                          filledBorderColor: Colors.green,
                          errorColor: Colors.red,

                          // Fill
                          fillColor: Colors.grey[100],
                          focusedFillColor: Colors.blue[50],
                          filledFillColor: Colors.green[50],

                          // Text
                          textStyle: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),

                          obscuringCharacter: '●',

                          // Cursor
                          showCursor: true,
                          cursorColor: Colors.blue,
                          cursorWidth: 2,
                          animateCursor: true,

                          // Animation
                          entryAnimation: MaterialPinAnimation.scale,
                          animationDuration: Duration(milliseconds: 150),
                          animationCurve: Curves.easeOut,

                          // Error
                          enableErrorShake: true,
                          errorAnimationDuration: Duration(milliseconds: 500),



                        ),


                        validator: (value) {
                          if (value == null || value.length < 6) {
                            return '';
                          }
                          return null;
                        },
                        onSaved: (value) => print('Saved: $value'),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () {
                      final pin = _pinController.text;

                      if (pin.isEmpty || pin.length != 6) {
                        _pinController.triggerError(); // 🔥 এইটাই আসল
                        setState(() {
                        });
                        return;
                      }

                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        PasswordResetUpdatePassword.routeName,
                            (route) => false,
                      );
                    },
                    child: Icon(Icons.arrow_circle_right_outlined),
                  ),

                  SizedBox(height: 20),

                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: "Have an account? ",
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
    );
    ;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pinController.dispose();
  }
}
