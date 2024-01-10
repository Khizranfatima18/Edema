import 'package:edemadetection/screens/dashboard.dart';
import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  final Items item;

  Screen2(this.item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
      ),
      body: Center(
        child: Text("Screen 2 content"),
      ),
    );
  }
}
