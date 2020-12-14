import 'package:flutter/material.dart';
import 'package:manager/models/Product.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    TextStyle lightTextStyle = TextStyle(color: rText.withOpacity(0.6));
    return Container(
      padding: EdgeInsets.symmetric(horizontal: defaultSize * 2),
      height: defaultSize * 37.5, //375
      width: defaultSize *
          (SizeConfig.orientation == Orientation.landscape ? 35 : 15), //150
      // color: Colors.black45,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(product.category.toUpperCase(), style: lightTextStyle),
            SizedBox(height: defaultSize),
            Text(
              product.title,
              style: TextStyle(
                fontSize: defaultSize * 2.4, //24
                fontWeight: FontWeight.bold,
                letterSpacing: -0.8,
                height: 1.4,
              ),
            ),
            SizedBox(height: defaultSize * 2),
            Text("Precio:", style: lightTextStyle),
            Text(
              "\$${product.price}",
              style: TextStyle(
                fontSize: defaultSize * 1.6, //16
                fontWeight: FontWeight.bold,
                height: 1.6,
              ),
            ),
            SizedBox(height: defaultSize * 2), //20
            Text("Medidas:", style: lightTextStyle),
            Row(
              children: <Widget>[
                Text("${product.size}"),
                
              ],
            ),
          ],
        ),
      ),
    );
  }

  
}
