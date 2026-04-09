import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Utils/pathclass.dart';

class Background_Screen extends StatelessWidget {
  const Background_Screen({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.scrollable = true,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final bool scrollable;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Fixed Background
        Positioned.fill(
          child: SvgPicture.asset(PathClass.background, fit: BoxFit.cover),
        ),

        // Foreground Content
        SafeArea(
          child: scrollable
              ? SingleChildScrollView(padding: padding, child: child)
              : Padding(padding: padding, child: child),
        ),
      ],
    );
  }
}
