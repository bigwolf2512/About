import 'package:b13_flutter/features/home/screen/home.dart';
import 'package:b13_flutter/localizations/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';

class FlashScreen extends StatefulWidget {
  @override
  _FlashState createState() => _FlashState();
}

class _FlashState extends State<FlashScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context).pushReplacementNamed(HomeScreen.route);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[Center(child: Text('Flash Screen'))],
      ),
    );
  }
}
