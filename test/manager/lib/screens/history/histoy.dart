import 'package:flutter/material.dart';
import 'components/body.dart';

class History extends StatelessWidget {
  static String routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "Escaneo Previos",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "10 escaneos",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
