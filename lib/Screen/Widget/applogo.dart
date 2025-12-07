import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../util/image_path.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
        ImagePath.logo_path,
      width: 150,

    );
  }
}