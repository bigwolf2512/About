import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShadowedContainer extends StatelessWidget {
  final Color backgroundColor;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final EdgeInsets? margin;
  final EdgeInsetsGeometry? padding;
  final List<BoxShadow>? boxShadow;
  final Widget child;

  ShadowedContainer({
    required this.child,
    this.backgroundColor = Colors.transparent,
    this.width,
    this.height,
    this.borderRadius,
    this.margin,
    this.boxShadow,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      width: width,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
        boxShadow: boxShadow ??
            [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
      ),
      child: child,
    );
  }
}
