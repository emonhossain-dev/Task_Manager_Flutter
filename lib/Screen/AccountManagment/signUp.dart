import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/Screen/AccountManagment/signIn.dart';

import '../Widget/main_bg_sceen.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  static const String name = "/sign-up";

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _firstNamecontroller = TextEditingController();
  final TextEditingController _lastNamecontroller = TextEditingController();
  final TextEditingController _numbercontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

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
                    key: _formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 40,),

                        Text("Join With Us", style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,

                        ),
                        ),

                        SizedBox(height: 20,),

                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailcontroller,
                          decoration: InputDecoration(
                            hintText: "Email",

                          ),



                        ),

                        SizedBox(height: 20,),

                        TextFormField(
                            keyboardType: TextInputType.text,
                            controller: _firstNamecontroller,
                            decoration: InputDecoration(
                              hintText: "First Name",
                            )
                        ),

                        SizedBox(height: 20,),

                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: _lastNamecontroller,
                          decoration: InputDecoration(
                            hintText: "Last Name",

                          ),



                        ),

                        SizedBox(height: 20,),

                        TextFormField(
                            keyboardType: TextInputType.phone,
                            controller: _numbercontroller,
                            decoration: InputDecoration(
                              hintText: "Mobile",
                            )
                        ),

                        SizedBox(height: 20,),

                        TextFormField(
                            keyboardType: TextInputType.text,
                            controller: _passwordcontroller,
                            decoration: InputDecoration(
                              hintText: "Password",
                            )
                        ),

                        SizedBox(height: 20,),

                        ElevatedButton(

                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(8)
                              ),
                              fixedSize: const Size.fromWidth(double.maxFinite),
                            ),

                            onPressed: (){

                            }, child:
                        Icon(Icons.navigate_next, color: Colors.white,)

                        ),

                        SizedBox(height: 40,),


                        Center(
                          child: RichText(text: TextSpan(text: "Have an account? ",style: TextStyle(color: Colors.black54),
                              children: [
                                TextSpan(text: "Sign In",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold
                                    ),
                                    recognizer: TapGestureRecognizer()..onTap = (){
                                      Navigator.pushNamedAndRemoveUntil(context, SingIn.name, (Route<dynamic> route) => false,);
                                    }

                                ),


                              ]
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




}



