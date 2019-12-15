import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:drawer_no_appbar_ex/providers/pixabay_photos.dart';
import 'package:drawer_no_appbar_ex/screens/flutter_screen.dart';
import 'package:drawer_no_appbar_ex/screens/flower_screen.dart';
import 'package:drawer_no_appbar_ex/screens/login_screen.dart';
import 'package:drawer_no_appbar_ex/screens/profile_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PixabayPhotos(),
      child: MaterialApp(
        title: 'Drawer without AppBar',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginScreen(),
        routes: {
          LoginScreen.route: (_) => LoginScreen(),
          FlowerScreen.route: (_) => FlowerScreen(),
          FlutterScreen.route: (_) => FlutterScreen(),
          ProfileScreen.route: (_) => ProfileScreen(),
        },
      ),
    );
  }
}
