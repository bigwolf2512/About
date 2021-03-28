import 'package:b13_flutter/commands/navigate_to_command.dart';
import 'package:b13_flutter/routing/page_configurations/auth_page_configuration.dart';
import 'package:b13_flutter/shared/styled_widgets/buttons/styled_btn.dart';
import 'package:flutter/cupertino.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          SizedBox(height: 100,),
          Text('Landing Page'),
          TextBtn('Login', onPressed: (){
            NavigateToCommand().run(AuthPageConfiguration());
          }),
        ],
      ),
    );
  }

}