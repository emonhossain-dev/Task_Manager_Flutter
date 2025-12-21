import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/Screen/Widget/appbar.dart';

import '../../Api Integration/Base_url.dart';
import '../Widget/main_bg_sceen.dart';
import 'homepage.dart';

class AddNewData extends StatefulWidget {
  AddNewData({super.key});

  static const String name = "/add-new-data";

  @override
  State<AddNewData> createState() => _AddNewDataState();
}

class _AddNewDataState extends State<AddNewData> {
  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

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
                          controller: _titleController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: "Title",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.8),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _descriptionController,
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
                           InsertDataRequest(context);
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

  @override
  void dispose() {
    // TODO: implement dispose
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void InsertDataRequest(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");

    if (token == null || token.isEmpty) {
      print("Token not found");
      return;
    }

    print(token);

    String _titleS = _titleController.text.trim();
    String _descriptionS = _descriptionController.text.trim();

    final dio = Dio(
      BaseOptions(
        baseUrl: BaseUrl().BASEURL,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      ),
    );

    Map<String, String> body = {
      "title": _titleS,
      "description": _descriptionS,
    };

    try {
      Response response = await dio.post(
        BaseUrl().INSERT_DATA_URL,
        data: body,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        var res = response.data; // response.data হলো পুরো JSON Map

        String message = res['message'] ?? "No message"; // "Task created successfully"
        bool success = res['success'] ?? false; // true

        var data = res['data']; // data এর ভিতরের অংশ


        if(success == true) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message)),);

          Navigator.pushNamedAndRemoveUntil(context, Homepage.name, (_) => false);
        }


        print(message);
        print(data['user_id']);
        print(data['title']);
        print(data['description']);
        print(data['status']);
        print(data['id']);
      }





    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Exception: $e")),
      );
    }
  }
}
