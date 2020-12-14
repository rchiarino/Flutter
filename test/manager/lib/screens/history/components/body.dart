import 'package:flutter/material.dart';
import 'package:manager/services/products.dart';

import './rearrange.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: FutureBuilder(
          future: fetchProducts(),
          builder: (context, snapshot) {
            return snapshot.hasData
                ? Rearrange(products: snapshot.data)
                : Center(child: Image.asset('assets/loader.gif'));
          }

          ),
    );
  }
}
