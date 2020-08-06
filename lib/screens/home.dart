import 'package:flutter/material.dart';
import 'package:sos_app/widgets/drawer.dart';
import 'package:sos_app/constants.dart' as constant;
import 'package:sos_app/widgets/logo.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Home')),
      drawer: AppDrawer(constant.Route.home),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: logoWidget(),
            alignment: Alignment.center,
          ),
          SizedBox(
            height: 30,
          ),
          Container(
          child: new Text("Welcome to the SOS Feedback App"),
            alignment: Alignment.center,
          )
        ],
      ),
    );
  }
}
