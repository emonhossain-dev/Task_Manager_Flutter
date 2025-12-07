import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/Screen/AccountManagment/Forget_password/pinveritication.dart';

import '../../Widget/main_bg_sceen.dart';
import '../signIn.dart';

class SetPassword extends StatefulWidget {
  const SetPassword({super.key});

  static const String name = "/set-password";

  @override
  State<SetPassword> createState() => _SetPasswordState();
}

class _SetPasswordState extends State<SetPassword> {
  final TextEditingController _emailcontroller = TextEditingController();
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
                        SizedBox(height: 100,),

                        Text("Set Password", style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,

                        ),
                        ),

                        Text("Minimum length password 8 charecter with Latter and number combination", style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey

                        ),
                        ),

                        SizedBox(height: 20,),

                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: _emailcontroller,
                          decoration: InputDecoration(
                            hintText: "Password",

                          ),
                        ),
                        SizedBox(height: 20,),

                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: _emailcontroller,
                          decoration: InputDecoration(
                            hintText: "Confirm Password",

                          ),
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

                              Navigator.pushNamedAndRemoveUntil(context, SingIn.name, (Route<dynamic> route) => false,);
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
    super.dispose();
  }




}

