import 'package:flutter/material.dart';
import 'package:task_manager/Screen/UI/Main_Screen/update_screen.dart';

import '../../Utils/appColors.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  const Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, UpdateScreen.routeName);
            },

            child: CircleAvatar(),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name",
                  style: textTheme.titleSmall?.copyWith(color: Colors.white),
                ),
                Text(
                  "emonhossain@gmail.com",
                  style: textTheme.bodySmall?.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.logout_outlined, color: Colors.white),
          ),
        ],
      ),
      backgroundColor: AppColors.app_color,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
