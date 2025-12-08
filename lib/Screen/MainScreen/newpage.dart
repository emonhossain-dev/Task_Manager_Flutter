import 'package:flutter/material.dart';
import 'package:task_manager/Screen/MainScreen/addnewdata.dart';

class NewPage extends StatefulWidget {
  const NewPage({super.key});

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.pushNamed(context, AddNewData.name);
      },
        child: Icon(Icons.add),
      ),


    );
  }
}
