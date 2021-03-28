import 'package:b13_flutter/commands/navigate_to_command.dart';
import 'package:b13_flutter/features/home/home_page.dart';
import 'package:b13_flutter/routing/page_configurations/meal_detail_page_configuration.dart';
import 'package:b13_flutter/shared/styled_widgets/buttons/styled_btn.dart';
import 'package:b13_flutter/shared/widgets/app_layout_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sized_context/sized_context.dart';

class MealPlannerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MealPlannerPageState();
  }
}

class _MealPlannerPageState extends State<MealPlannerPage> with AutomaticKeepAliveClientMixin {

  @override
  Widget build(BuildContext context) {
    super.build(context);
    EdgeInsets safePadding = context.mq.padding;
    return AppLayoutPage(
      topBar: Container(
        height: 112,
        color: Colors.red.withAlpha(90),
      ),
      child: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(height: 112,),
              Text('Meal Planner'),
              TextBtn(
                'Meal Detail',
                onPressed: () {
                  NavigateToCommand().run(MealDetailPageConfiguration('123123'));
                },
              ),
              Container(
                height: 300,
                color: Colors.limeAccent,
              ),
              Container(
                height: 300,
                color: Colors.blue,
              ),
              Container(
                height: 300,
                color: Colors.green,
              ),
              Container(
                height: 300,
                color: Colors.deepPurpleAccent,
              ),
              SizedBox(
                height: safePadding.bottom + HomePage.tabBarHeight + 10,
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
