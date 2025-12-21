import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/Model/item_count.dart';
import 'package:task_manager/Screen/MainScreen/completepage.dart';
import 'package:task_manager/Screen/MainScreen/newpage.dart';
import 'package:task_manager/Screen/MainScreen/progresspage.dart';

import '../../Api Integration/Base_url.dart';
import '../Widget/appbar.dart';
import 'canceledpage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  static const String name = "/home";

  @override
  State<Homepage> createState() => _HomepageState();
}
class _HomepageState extends State<Homepage> with WidgetsBindingObserver {
  int _selectedIndex = 0;
  List<Widget> _bottom_sceen = [
    NewPage(),
    CompletePage(),
    ProgressPage(),
    CanceledPage(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this); // observer add

  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this); // observer remove
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      // এখানে app আবার foreground এ এলে data refresh হবে
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: _bottom_sceen[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.add_box_outlined), label: 'New'),
          NavigationDestination(icon: Icon(Icons.done_all), label: 'Complete'),
          NavigationDestination(icon: Icon(Icons.incomplete_circle), label: 'Progress'),
          NavigationDestination(icon: Icon(Icons.delete_forever), label: 'Canceled'),
        ],
      ),
    );
  }


}

