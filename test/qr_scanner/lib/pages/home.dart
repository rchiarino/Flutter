import 'package:flutter/material.dart';
import 'package:qr_scanner/global/const.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [
            InkWell(    
              borderRadius: BorderRadius.circular(25.0),
              child: IconButton(
                icon: Icon(Icons.search_rounded),
                color: rPrimary,
                onPressed: () {
                  debugPrint("Search Pressed!");
                },
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(25.0),
              child: IconButton(
                icon: Icon(Icons.info_outline_rounded),
                color: rPrimary,
                onPressed: () {
                  debugPrint("Info Pressed!");
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
