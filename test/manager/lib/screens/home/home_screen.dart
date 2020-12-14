import 'package:flutter/material.dart';
import 'package:manager/screens/home/components/body.dart';
import 'package:manager/size_config.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // It help us to  make our UI responsive
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
