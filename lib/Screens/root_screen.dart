import 'package:dashfanclub/Constants/colors.dart';
import 'package:dashfanclub/Screens/Detector/detector.dart';
import 'package:dashfanclub/Screens/Home/home_screen.dart';
import 'package:dashfanclub/Screens/graphs_screen/line_graphs.dart';
import 'package:flutter/material.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _selectedIndex = 0;

  static List<Widget> pages = <Widget>[
    HomeScreen(),
    const LineChartSample1(),
    // Container(color: Colors.black12),
    Container(color: Colors.black26),
    Container(color: Colors.black38),
    const DashDetector(),
  ];

  _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MyDash",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("MyDash"),
          backgroundColor: primary,
        ),
        body: pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Colors.blueGrey[400],
          unselectedLabelStyle: TextStyle(color: Colors.blueGrey[400]),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,

          onTap: _onItemTap,

          // backgroundColor: primary,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.auto_graph_outlined), label: 'Insights'),
            BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble_outline), label: 'Chat'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined), label: 'Shop'),
            BottomNavigationBarItem(
                icon: Icon(Icons.flutter_dash_outlined), label: 'Detector')
          ],
        ),
      ),
    );
  }
}
