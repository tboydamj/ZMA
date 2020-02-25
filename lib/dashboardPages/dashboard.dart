import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_login_screen/dashboardPages/profile.dart';
import 'package:flutter_login_screen/dashboardPages/settings.dart';
import 'car_commands.dart';
import 'map.dart';

void main(){
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  .then((_){
    runApp(DashBoard());
  });
  //runApp(DashBoard());
}

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(128, 0, 128, 1.0),
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    MapPage(),
    CarCodes(),
    CarProfile(),
    AppSetting()
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Zoomed'),
        backgroundColor: Colors.purple,
        elevation: .9,
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.map), title: Text('Home'),),
            BottomNavigationBarItem(
              icon: Icon(Icons.list), title: Text('Commands')
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.directions_car), title: Text('Profile'),),
            BottomNavigationBarItem(
                icon: Icon(Icons.menu), title: Text('Settings')),
          ]),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

class PlaceholderWidget extends StatelessWidget {
  final Color color;

  PlaceholderWidget(this.color);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: color,
    );
  }
}
