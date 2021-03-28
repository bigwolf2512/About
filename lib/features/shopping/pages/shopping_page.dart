import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShoppingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ShoppingPageState();
  }
}

class _ShoppingPageState extends State<ShoppingPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      color: Colors.amberAccent,
      child: Column(
        children: [
          Text('Shopping'),
        ],
      ),
    );
  }
}
