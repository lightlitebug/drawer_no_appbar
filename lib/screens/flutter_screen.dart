import 'package:drawer_no_appbar_ex/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FlutterScreen extends StatelessWidget {
  static final route = 'flutter-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Logo'),
      ),
      body: Center(
        child: FlutterLogo(
          size: 180,
        ),
      ),
      drawer: MainDrawer(),
    );
  }
}
