import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InventoryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InventoryPageState();
  }
}

class _InventoryPageState extends State<InventoryPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      color: Colors.green,
      child: Column(
        children: [
          Text('Inventory'),
        ],
      ),
    );
  }
}
