import 'package:b13_flutter/commands/navigate_back_command.dart';
import 'package:b13_flutter/shared/styled_widgets/buttons/styled_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MealDetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MealDetailPageState();
  }
}

class _MealDetailPageState extends State<MealDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.limeAccent,
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          SizedBox(height: 100,),
          TextBtn('Back', onPressed: () {
            NavigateBackCommand().run();
          }),
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Center(
                child: Text('Meal Detail'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
