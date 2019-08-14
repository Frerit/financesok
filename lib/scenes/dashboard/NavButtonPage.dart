import 'package:financesok/scenes/dashboard/DashboardPage.dart';
import 'package:financesok/styles/theme_login.dart' as Theme;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationdPage extends StatefulWidget {
  @override
  _NavigationdPageState createState() => _NavigationdPageState();
}

class _NavigationdPageState extends State<NavigationdPage> {
  int _currentIndex = 1;

  Widget callPage(int index) {
    switch (index) {
      case 0:
        break;
      case 1:
        return DashBoadPage();
      case 2:
        break;
      case 3:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dashboard",
      theme: ThemeData(
          primarySwatch: Colors.cyan,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
              "Dash"
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        drawer: Drawer(
          child: ListView(

          ),
        ),
        body: callPage(_currentIndex),
        bottomNavigationBar:BottomNavigationBar(
          currentIndex: _currentIndex,
            onTap: (value) {
              setState(() {
                _currentIndex = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  FontAwesomeIcons.cubes,
                  color: Colors.grey,
                ),
                activeIcon: Icon(
                  FontAwesomeIcons.cubes,
                  color: Theme.Colors.loginGradientEnd,
                ),
                title: Text("")
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                      FontAwesomeIcons.home,
                    color: Colors.grey,
                  ),
                  activeIcon: Icon(
                    FontAwesomeIcons.home,
                    color: Theme.Colors.loginGradientEnd,
                  ),
                  title: Text("")
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                      FontAwesomeIcons.bell,
                    color: Colors.grey,
                  ),
                  activeIcon: Icon(
                    FontAwesomeIcons.bell,
                    color: Theme.Colors.loginGradientEnd,
                  ),
                  title: Text("")
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                      FontAwesomeIcons.userCircle,
                    color: Colors.grey,
                  ),
                  activeIcon: Icon(
                    FontAwesomeIcons.userCircle,
                    color: Theme.Colors.loginGradientEnd,
                  ),
                  title: Text("")
              ),
            ]
        ),
      ),
    );
  }
}
