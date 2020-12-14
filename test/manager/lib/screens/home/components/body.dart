import 'package:flutter/material.dart';
import 'package:manager/components/title_text.dart';
import 'package:manager/services/products.dart';
import 'package:manager/size_config.dart';

import 'recommond_products.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    // It enables scrolling
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(defaultSize * 2), //20
              child: Center(child: TitleText(title: "Palmeras",)),
            ),
            FutureBuilder(
              future: fetchProducts(),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? RecommandProducts(products: snapshot.data)
                    : Center(child: Image.asset('assets/loader.gif'));
              },
            ),
          ],
        ),
      ),
    );
  }
}
