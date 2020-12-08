import 'package:finacash/Widgets/AnimatedBottomNavBar.dart';
import 'package:finacash/screen/Pengeluaran.dart';
import 'package:finacash/screen/HomePage.dart';
import 'package:finacash/screen/Pemasukan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InicialPage extends StatefulWidget {
  final List<BarItem> barItems = [
    BarItem(
      text: "Pengeluaran",
      iconData: Icons.remove_circle_outline,
      color: Colors.pinkAccent,
    ),
    BarItem(
      text: "Home",
      iconData: Icons.home,
      color: Colors.indigo,
    ),
    BarItem(
      text: "Pemasukan",
      iconData: Icons.add_circle_outline,
      color: Colors.teal,
    ),
    // BarItem(
    //   text: "Search",
    //   iconData: Icons.search,
    //   color: Colors.yellow.shade900,
    // ),
  ];

  @override
  _InicialPageState createState() => _InicialPageState();
}

class _InicialPageState extends State<InicialPage> {
  int selectedBarIndex = 1;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        //systemNavigationBarColor: Colors.lightBlue[700], // navigation bar color
        //statusBarColor: Colors.lightBlue[700],
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        statusBarIconBrightness: Brightness.light // status bar color
        ));

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    List<Widget> telas = [DespesasResumo(), HomePage(), ReceitasResumo()];

    // _allMov();
    // print("\nMes atual: " + DateTime.now().month.toString());

    return Scaffold(
      body: telas[selectedBarIndex],
      bottomNavigationBar: AnimatedBottomBar(
        barItems: widget.barItems,
        animationDuration: const Duration(milliseconds: 550),
        barStyle: BarStyle(fontSize: width * 0.045, iconSize: width * 0.07),
        onBarTap: (index) {
          setState(() {
            selectedBarIndex = index;
          });
        },
      ),
    );
  }
}
