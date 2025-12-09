import 'package:flutter/material.dart';

import '../Widget/itemlist.dart';

class CompletePage extends StatefulWidget {
  const CompletePage({super.key});

  @override
  State<CompletePage> createState() => _CompletePageState();
}

class _CompletePageState extends State<CompletePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView.builder(

        itemCount: 10,
        itemBuilder: (context, index) {
          return Item_List("Completed");

        },
      ),

    );
  }
}
