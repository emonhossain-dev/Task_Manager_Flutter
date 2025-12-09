import 'package:flutter/material.dart';

import '../Widget/itemlist.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({super.key});

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView.builder(

        itemCount: 10,
        itemBuilder: (context, index) {
          return Item_List("Progress");

        },
      ),

    );
  }
}
