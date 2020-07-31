import 'package:flutter/material.dart';
import 'package:sos_app/widgets/drawer.dart';
import 'package:sos_app/constants.dart' as constant;

class ProfileScreen extends StatelessWidget {
  Widget buildScreen() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 0.0),
      child: new Text("Profile"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Profile')),
      drawer: AppDrawer(constant.Route.profile),
      body: Stack(
        children: <Widget>[
          buildScreen(),
        ],
      ),
    );
  }
}
