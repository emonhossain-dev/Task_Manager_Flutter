import 'package:flutter/material.dart';
import 'package:task_manager/Screen/Widget/appbar.dart';

import '../Widget/main_bg_sceen.dart';
import 'homepage.dart';

class AddNewData extends StatelessWidget {
  AddNewData({super.key});

  static const String name = "/add-new-data";
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _discribtionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(),
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
                          "Add New Task",
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _subjectController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: "Subject",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.8),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _discribtionController,
                          maxLines: 6,
                          decoration: InputDecoration(
                            hintText: "Discribtion",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.8),
                          ),
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
                            Navigator.pushNamedAndRemoveUntil(context, Homepage.name, (_) => false);
                          },
                          child: Icon(Icons.navigate_next, color: Colors.white),
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
