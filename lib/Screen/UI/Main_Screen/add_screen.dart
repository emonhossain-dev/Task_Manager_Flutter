import 'package:flutter/material.dart';

import '../../Widget/app_bar.dart';
import '../../Widget/changestatus_card.dart';
import '../../Widget/task_list_widget.dart';
import 'insert_task.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                ChangeStatus_Card(count: 5, status: "new task"),
                ChangeStatus_Card(count: 10, status: "complete"),
                ChangeStatus_Card(count: 32, status: "cancel"),
                ChangeStatus_Card(count: 4, status: "progress"),
              ],
            ),
        
            ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: 10,
              itemBuilder: (context, index) {
                return TaskItemWidget(textTheme: _textTheme);
              },
            ),
          ],
        ),
      ),
      
      floatingActionButton: FloatingActionButton(onPressed: (){

        Navigator.pushNamed(context, InsertTask.routeName);

      }, child: Icon(Icons.add),),
      
    );
  }
}


