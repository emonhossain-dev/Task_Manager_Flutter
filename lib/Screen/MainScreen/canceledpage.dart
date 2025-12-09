import 'package:flutter/material.dart';

import '../Widget/itemlist.dart';

class CanceledPage extends StatefulWidget {
  const CanceledPage({super.key});

  @override
  State<CanceledPage> createState() => _CanceledPageState();
}

class _CanceledPageState extends State<CanceledPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView.builder(

        itemCount: 10,
        itemBuilder: (context, index) {
          return Item_List("Canceled");

        },
      ),

    );
  }
}
