import 'package:flutter/material.dart';
import 'package:drawer_no_appbar_ex/screens/flutter_screen.dart';
import 'package:drawer_no_appbar_ex/screens/flower_screen.dart';
import 'package:drawer_no_appbar_ex/screens/login_screen.dart';
import 'package:drawer_no_appbar_ex/screens/profile_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 300,
                child: Image.asset(
                  'assets/images/profile_bg_01.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 10),
                width: 100,
                height: 100,
                child: Image.asset('assets/images/default-user.png'),
              )
            ],
          ),
          SizedBox(height: 30),
          ListTile(
            onTap: () => Navigator.pushReplacementNamed(
              context,
              FlowerScreen.route,
            ),
            leading: Icon(Icons.favorite),
            title: Text(
              'Flowers',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          ListTile(
            onTap: () => Navigator.pushReplacementNamed(
              context,
              FlutterScreen.route,
            ),
            leading: FlutterLogo(size: 30),
            title: Text(
              'Flutter',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          ListTile(
            onTap: () => Navigator.pushReplacementNamed(
              context,
              ProfileScreen.route,
            ),
            leading: Icon(Icons.account_circle),
            title: Text(
              'Profile',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          ListTile(
            onTap: () => Navigator.pushReplacementNamed(
              context,
              LoginScreen.route,
            ),
            leading: Icon(Icons.exit_to_app),
            title: Text(
              'Logout',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
