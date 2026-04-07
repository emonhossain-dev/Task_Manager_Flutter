import 'package:flutter/material.dart';
import 'package:task_manager/Screen/UI/Main_Screen/add_screen.dart';
import 'package:task_manager/Screen/UI/Main_Screen/cancel_screen.dart';
import 'package:task_manager/Screen/UI/Main_Screen/complete_screen.dart';
import 'package:task_manager/Screen/UI/Main_Screen/progress_screen.dart';
import 'package:task_manager/Utils/appColors.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  static const String routeName = '/home';

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  List<Widget> _screens = [


    AddScreen(),
    CompleteScreen(),
    CancelScreen(),
    ProgressScreen(),
  ];
  int _selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Name"), backgroundColor: AppColors.app_color,),

      body: _screens[_selectedIndex],

      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          _selectedIndex = index;
          setState(() {
          });
        },

        destinations: const [
          NavigationDestination(icon: Icon(Icons.add_box_outlined), label: "New Task"),
          NavigationDestination(icon: Icon(Icons.incomplete_circle), label: "Complete"),
          NavigationDestination(icon: Icon(Icons.cancel_presentation), label: "Cancel"),
          NavigationDestination(icon: Icon(Icons.incomplete_circle), label: "Progress"),
        ],
      ),
    );
  }
}
