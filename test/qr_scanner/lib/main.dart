import 'package:flutter/material.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:qr_scanner/global/const.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex;
  String qrCodeResult;



  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        //qr scann
        onPressed: () async {
                ScanResult codeSanner = await BarcodeScanner.scan(
                  options: ScanOptions(
                    useCamera: -1,
                  ),
                ); //barcode scnner
                setState(() {
                  qrCodeResult = codeSanner.rawContent;
                });
              },
        child: Icon(Icons.qr_code_rounded),
        backgroundColor: rPrimary,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BubbleBottomBar(
        hasNotch: true,
        fabLocation: BubbleBottomBarFabLocation.end,
        opacity: .2,
        currentIndex: currentIndex,
        onTap: changePage,
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(
                16)), //border radius doesn't work when the notch is enabled.
        elevation: 8,
        items: <BubbleBottomBarItem>[
          //Home
          BubbleBottomBarItem(
              icon: Icon(
                Icons.dashboard_rounded,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.dashboard_rounded,
                color: Colors.blueAccent,
              ),
              backgroundColor: Colors.blueAccent,
              title: Text("Inicio")),
          
          //Previews Scans    
          BubbleBottomBarItem(
              icon: Icon(
                Icons.history_rounded,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.history_rounded,
                color: Colors.blueAccent,
              ),
              backgroundColor: Colors.blueAccent,
              title: Text("Logs")),
        ],
      ),
    );
  }
}