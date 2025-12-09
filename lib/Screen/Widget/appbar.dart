import 'package:flutter/material.dart';
import 'package:task_manager/Screen/MainScreen/profile.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: GestureDetector(
          onTap: () {
            // Your action here
            print("Avatar tapped!");
            Navigator.pushNamed(context, ProfilePage.name);
          },
          child: const CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.person),
          ),
        ),
      ),

      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Rakibul Emon",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "emonhossain62@gmail.com",
            style: TextStyle(
              fontSize: 13,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

