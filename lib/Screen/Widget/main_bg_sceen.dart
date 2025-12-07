import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../util/image_path.dart';

class BackgroundScreen extends StatelessWidget {
  const BackgroundScreen({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: SvgPicture.asset(
            ImagePath.main_background_path,
            fit: BoxFit.cover,
          ),
        ),
        // SafeArea + keyboard padding
        Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SafeArea(child: child),
        ),
      ],
    );
  }
}
