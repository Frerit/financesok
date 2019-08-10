import 'package:financesok/styles/theme_login.dart' as Theme;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;

  Widget callPage(int index) {
    switch (index) {
      case 0:
        break;
      case 1:
        break;
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
      home: Scaffold(
        appBar: AppBar(
          title: Text("Dash"),
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
