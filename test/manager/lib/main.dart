import "package:flutter/material.dart";
import 'package:manager/constants.dart';
import "package:manager/screens/home/home_screen.dart";
import "package:google_fonts/google_fonts.dart";

//NAV
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';

import './screens/history/histoy.dart';
//QR
import 'package:barcode_scan/barcode_scan.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Manager',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme:
            GoogleFonts.dmSansTextTheme().apply(displayColor: rText),
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
          brightness: Brightness.light,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage();
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
      debugPrint(currentIndex.toString());
    });
  }

  var pages = [
    HomeScreen(),
    History(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //QR SCANNER
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          ScanResult codeSanner = await BarcodeScanner.scan(
            options: ScanOptions(
              useCamera: -1,
            ),
          ); //barcode scnner
          setState(() {
            qrCodeResult = codeSanner.rawContent;
            debugPrint(qrCodeResult);
          });
        },
        child: Icon(Icons.qr_code_rounded),
        backgroundColor: rPrimary,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BubbleBottomBar(
        hasNotch: false,
        fabLocation: BubbleBottomBarFabLocation.end,
        opacity: .2,
        currentIndex: currentIndex,
        onTap: changePage,
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(
                16)), //border radius doesn't work when the notch is enabled.
        elevation: 8,

        //Menu
        items: <BubbleBottomBarItem>[
          //Home
          BubbleBottomBarItem(
              icon: Icon(
                Icons.dashboard_rounded,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.dashboard_rounded,
                color: rPrimary,
              ),
              backgroundColor: rPrimary,
              title: Text("Inicio")),

          //Previews Scans
          BubbleBottomBarItem(
              icon: Icon(
                Icons.history_rounded,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.history_rounded,
                color: rPrimary,
              ),
              backgroundColor: rPrimary,
              title: Text("Logs")),
        ],
      ),

      //Change the main body
      body: pages[currentIndex],
    );
  }
}
