import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum AppIcons {
  dinner,
  grocery,
  logout,
  shopping,
}

class AppIcon extends StatelessWidget {
  final AppIcons icon;
  final double? size;
  final Color? color;
  final bool isSelected;

  const AppIcon(this.icon,
      {Key? key, this.size, this.color, this.isSelected = false})
      : super(key: key);

  Widget build(BuildContext c) {
    String i = describeEnum(icon).toLowerCase().replaceAll("_", "-");
    return Container(
      width: size,
      height: size,
      child: Center(
        child: Image.asset(
            'assets/images/icons/$i-icon${isSelected ? '-selected' : ''}.png',
            width: size,
            height: size,
            color: color),
      ),
    );
  }
}
