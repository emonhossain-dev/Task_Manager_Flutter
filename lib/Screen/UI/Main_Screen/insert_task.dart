import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/Screen/UI/Auth/login_screen.dart';
import 'package:task_manager/Screen/Widget/app_bar.dart';

import '../../../Utils/appColors.dart';
import '../../Widget/backgroud_widget.dart';
import '../bottom_nav.dart';

class InsertTask extends StatefulWidget {
  const InsertTask({super.key});

  @override
  State<InsertTask> createState() => _InsertTaskState();

  static const String routeName = '/InsertTask';
}

class _InsertTaskState extends State<InsertTask> {


  final _formKey = GlobalKey<FormState>();
  final TextEditingController _subController = TextEditingController();
  final TextEditingController _desController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;

    return Scaffold(

      appBar: Appbar(),

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
                    Text("Add New Task", style: _textTheme.titleLarge),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _subController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(hintText: "Subject"),
                      keyboardType: TextInputType.emailAddress,

                      validator: (value) {

                        if (value == null || value.isEmpty) {
                          return "Please enter your Subject";
                        }

                        return null;


                      },

                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _desController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(hintText: "Description"),
                      keyboardType: TextInputType.emailAddress,
                      maxLines: 6,

                      validator: (value) {

                        if (value == null || value.isEmpty) {
                          return "Please enter your Description";
                        }

                        return null;


                      },

                    ),
                    SizedBox(height: 20),

                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {

                          Navigator.pushNamed(context, BottomNav.routeName);

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
    _subController.dispose();
    _desController.dispose();
  }








}


