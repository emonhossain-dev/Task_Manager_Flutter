import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/Screen/AccountManagment/Forget_password/setPassword.dart';
import 'package:task_manager/Screen/MainScreen/homepage.dart';

import '../../../Api Integration/Base_url.dart';
import '../../Widget/main_bg_sceen.dart';
import '../signIn.dart';

class PinVerification extends StatefulWidget {
  const PinVerification({super.key});
  static const String name = "/forget_by_email";
  @override
  State<PinVerification> createState() => _PinVerificationState();
}

class _PinVerificationState extends State<PinVerification> {
  final TextEditingController _pinController = TextEditingController();
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

                        Text("Pin Verification", style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,

                        ),
                        ),

                        Text("A 4 digit verification pin will send to your email address", style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey

                        ),
                        ),

                        SizedBox(height: 20,),

                        Center(
                          child: Pinput(
                            controller: _pinController,
                            forceErrorState: true,
                            length: 6, // 🔥 এখানেই 6 digit
                            pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                            keyboardType: TextInputType.number,



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
                              RegisterCodeVerify();
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
    _pinController.dispose();
    super.dispose();
  }


  void RegisterCodeVerify() async {


    final prefs = await SharedPreferences.getInstance();
    String? email = await prefs.getString('user_email');
    String _pinS = _pinController.text.trim();


    final dio = Dio(
      BaseOptions(
        baseUrl: BaseUrl().BASEURL,
        followRedirects: false, // temporary
        validateStatus: (status) {
          return status! < 500; // 302 won't throw
        },
      ),
    );

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };

    Map<String, String> body = {
      "email": ?email,
      "code": _pinS,

    };

    try {
      Response response = await dio.post(
        BaseUrl().REGISTER_VERIFY_CODE_URL,
        data: body,
        options: Options(headers: headers),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // JSON response
        var res = response.data;

        String message = res['message'];

        print(message);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
            duration: const Duration(seconds: 1),
          ),
        );


        _RegisterComplete();
        
        
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




  void _RegisterComplete() async {
    final prefs = await SharedPreferences.getInstance();


    String? _firstnameS =  await prefs.getString('user_firstname');
    String? _lastNameS = await prefs.getString('user_lastname');
    String? _emailS =  await prefs.getString('user_email');
    String? _numberS = await prefs.getString('user_number');
    String? _passwordS =  await prefs.getString('user_password');

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
      "firstname": ?_firstnameS,
      "lastname": ?_lastNameS,
      "email": ?_emailS,
      "mobile": ?_numberS,
      "password": ?_passwordS,
      "password_confirmation": ?_passwordS,
    };

    try {
      Response response = await dio.post(
        BaseUrl().REGISTERCOMPLETE_URL,
        data: body,

      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // JSON response
        var res = response.data;

        String status = res['status'];
        String token = res['token'];
        String? message = response.data?['message'];
        
        print(status);
        print(message);
        print(token);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message!),
            duration: const Duration(seconds: 1),
          ),
        );
        
        
        if(!status.isEmpty && status.contains("success")) {

          var user = res['user'];
          String firstname = user['firstname'];
          String lastname  = user['lastname'];
          String email     = user['email'];
          String mobile    = user['mobile'];
          int userId       = user['id'];

          await prefs.clear();
          prefs.setString("token", token);
          prefs.setString("user_firstname", firstname);
          prefs.setString("user_lastname", lastname);
          prefs.setString("user_email", email);
          Navigator.pushNamedAndRemoveUntil(context, Homepage.name, (_) => false);
        } else {
          print("PRoblem");
        }

        
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

