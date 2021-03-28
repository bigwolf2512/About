import 'package:flutter/cupertino.dart';

class AppLayoutPage extends StatelessWidget {
  final Widget child;
  final Widget topBar;
  AppLayoutPage({required this.child,required this.topBar});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        topBar,
      ],
    );
  }

}