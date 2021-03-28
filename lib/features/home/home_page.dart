import 'package:b13_flutter/commands/set_current_user_command.dart';
import 'package:b13_flutter/features/inventory/pages/inventory_page.dart';
import 'package:b13_flutter/features/meal/pages/planner/meal_planner_page.dart';
import 'package:b13_flutter/features/shopping/pages/shopping_page.dart';
import 'package:b13_flutter/shared/styled_widgets/app_icons.dart';
import 'package:b13_flutter/shared/styled_widgets/buttons/styled_btn.dart';
import 'package:b13_flutter/shared/styled_widgets/shadowed_container.dart';
import 'package:b13_flutter/shared/widgets/alignments.dart';
import 'package:b13_flutter/shared/widgets/flexibles/separateed_flexibles.dart';
import 'package:flutter/material.dart';
import 'package:sized_context/sized_context.dart';

class HomePage extends StatefulWidget {
  static const double tabBarHeight = 65;
  @override
  State<StatefulWidget> createState() {
    return new _HomePageState();
  }
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    EdgeInsets padding = context.mq.padding;
    return Stack(
      children: [
        TabBarView(controller: _tabController, children: [
          MealPlannerPage(),
          InventoryPage(),
          ShoppingPage(),
        ]),
        BottomCenter(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ShadowedContainer(
                borderRadius: BorderRadius.circular(38.5),
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                height: HomePage.tabBarHeight,
                backgroundColor: Colors.white,
                child: SeparatedRow(
                  mainAxisSize: MainAxisSize.min,
                  separatorBuilder: () {
                    return SizedBox(
                      width: 15,
                    );
                  },
                  children: [
                    SimpleBtn(
                        child: AppIcon(
                          AppIcons.logout,
                          size: 35,
                        ),
                        onPressed: () {
                          SetCurrentUserCommand().run(null);
                        }),
                    SimpleBtn(
                        child: AppIcon(
                          AppIcons.dinner,
                          size: 35,
                        ),
                        onPressed: () {
                          _tabController.animateTo(0);
                        }),
                    SimpleBtn(
                        child: AppIcon(
                          AppIcons.grocery,
                          size: 35,
                        ),
                        onPressed: () {
                          _tabController.animateTo(1);
                        }),
                    SimpleBtn(
                        child: AppIcon(
                          AppIcons.shopping,
                          size: 35,
                        ),
                        onPressed: () {
                          _tabController.animateTo(2);
                        })
                  ],
                ),
              ),
              SizedBox(height: padding.bottom,)
            ],
          ),
        ),
      ],
    );
  }
}
