import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Utils/pathclass.dart';

class Background_Screen extends StatelessWidget {
  const Background_Screen({super.key, required this.child});

  final Widget child;


  @override
  Widget build(BuildContext context) {
    return Stack(

      children: [
        SvgPicture.asset(
          PathClass.background,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        child,
      ],


    );
  }
}
