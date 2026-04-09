import 'package:flutter/material.dart';

import '../../Widget/app_bar.dart';
import '../../Widget/task_list_widget.dart';

class CancelScreen extends StatefulWidget {
  const CancelScreen({super.key});

  @override
  State<CancelScreen> createState() => _CancelScreenState();
}

class _CancelScreenState extends State<CancelScreen> {
  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
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



    );
  }
}
