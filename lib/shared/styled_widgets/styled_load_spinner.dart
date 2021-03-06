import 'package:flutter/material.dart';
import 'package:b13_flutter/core_packages.dart';

class StyledLoadSpinner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return SizedBox(
        width: 24,
        height: 24,
        child: CircularProgressIndicator(
          backgroundColor: theme.greyWeak,
          valueColor: AlwaysStoppedAnimation<Color>(theme.greyStrong),
        ));
  }
}
