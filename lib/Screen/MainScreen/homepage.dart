import 'package:flutter/material.dart';
import 'package:task_manager/Screen/MainScreen/completepage.dart';
import 'package:task_manager/Screen/MainScreen/newpage.dart';
import 'package:task_manager/Screen/MainScreen/progresspage.dart';

import '../Widget/appbar.dart';
import 'canceledpage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  static const String name = "/home";

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  int _selectedIndex = 0;

  List<Widget> _bottom_sceen = [
    NewPage(),
    CompletePage(),
    ProgressPage(),
    CanceledPage(),
  ];




  @override
  Widget build(BuildContext context) {

    return Scaffold(


      appBar:const CustomAppBar(),


      body: _bottom_sceen[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          _selectedIndex = index;
          setState(() {
          });
        },
          destinations: const [
            NavigationDestination(icon: Icon(Icons.add_box_outlined, ), label: 'New'),
            NavigationDestination(icon: Icon(Icons.done_all, ), label: 'Complete'),
            NavigationDestination(icon: Icon(Icons.incomplete_circle, ), label: 'Progress'),
            NavigationDestination(icon: Icon(Icons.delete_forever, ), label: 'Canceled'),
          ]

          )

    );
  }
}

