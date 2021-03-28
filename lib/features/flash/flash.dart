import 'package:b13_flutter/commands/base_command.dart';
import 'package:b13_flutter/models/main_app_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FlashScreen extends StatefulWidget {
  @override
  _FlashState createState() => _FlashState();
}

class _FlashState extends State<FlashScreen> {
  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = context.select((MainAppState app) => app.theme);
    return Scaffold(
      backgroundColor: appTheme.accent1,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[Center(child: Text('Flash Screen'))],
      ),
    );
  }
}
