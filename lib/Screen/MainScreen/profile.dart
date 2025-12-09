import 'package:flutter/material.dart';
import '../Widget/main_bg_sceen.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const String name = "/profile";

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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20,),

                      Text("Update Profile", style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,

                      ),
                      ),

                      SizedBox(height: 40,),

                      SizedBox(
                        height: 48,
                        child: Stack(
                          children: [
                            // White input background
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              height: 48,
                            ),

                            // Positioned label box
                            Positioned(
                              top: 0,
                              bottom: 0,
                              left: 0,
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                decoration: const BoxDecoration(
                                  color: Colors.grey, // dark background
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    bottomLeft: Radius.circular(8),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: const Text(
                                  "Photos",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),

                            // The input text field with left padding to avoid overlap
                            Positioned.fill(
                              left: 100, // width of label box + some spacing
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Enter photos URL or something...",
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 20,),

                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "Email",

                        ),



                      ),

                      SizedBox(height: 20,),

                      TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: "First Name",
                          )
                      ),

                      SizedBox(height: 20,),

                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Last Name",

                        ),



                      ),

                      SizedBox(height: 20,),

                      TextFormField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            hintText: "Mobile",
                          )
                      ),

                      SizedBox(height: 20,),

                      TextFormField(
                          keyboardType: TextInputType.text,
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
}



