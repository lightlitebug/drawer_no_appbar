import 'package:drawer_no_appbar_ex/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  static final route = 'profile-screen';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Image(
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
                image: AssetImage('assets/images/profile_bg_02.jpg'),
              ),
              Positioned(
                top: 40,
                left: 20,
                child: IconButton(
                  icon: Icon(Icons.menu),
                  iconSize: 30,
                  color: Colors.white,
                  onPressed: () {
                    _scaffoldKey.currentState.openDrawer();
                  },
                ),
              ),
              Positioned(
                bottom: 10,
                child: Image(
                  height: 120,
                  width: 120,
                  image: AssetImage('assets/images/default-user.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          SizedBox(height: 30.0),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              children: <Widget>[
                Card(
                  child: ListTile(
                    leading: Icon(Icons.email),
                    title: Text('your@email.com'),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.phone),
                    title: Text('000-000-0000'),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.location_city),
                    title: Text('Seoul'),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.favorite),
                    title: Text('Crossfit'),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.movie),
                    title: Text('God Father Series'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
