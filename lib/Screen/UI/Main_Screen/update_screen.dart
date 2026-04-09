import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/Screen/UI/Auth/registration_screen.dart';
import 'package:task_manager/Screen/UI/bottom_nav.dart';
import 'package:task_manager/Screen/Widget/backgroud_widget.dart';
import 'package:task_manager/Utils/appColors.dart';


class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();

  static const String routeName = '/update';
}

class _UpdateScreenState extends State<UpdateScreen> {


  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
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
                    SizedBox(height: 70),
                    Text("Update Profile", style: _textTheme.titleLarge),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: _imageController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.emailAddress,

                    ),
                    SizedBox(height: 8),
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
                    SizedBox(height: 8),
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
                    SizedBox(height: 8),
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
                    SizedBox(height: 8),
                    TextFormField(
                      controller: _mobileNumberController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(hintText: "Mobile"),
                      keyboardType: TextInputType.emailAddress,

                      validator: (value) {

                        if (value == null || value.isEmpty) {
                          return "Please enter your Mobile";
                        }

                        return null;


                      },

                    ),
                    SizedBox(height: 8),
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
    _passwordController.dispose();
    _imageController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _mobileNumberController.dispose();




  }








}


