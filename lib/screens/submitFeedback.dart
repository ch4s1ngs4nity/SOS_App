import 'package:flutter/material.dart';
import 'package:sos_app/widgets/drawer.dart';
import 'package:sos_app/constants.dart' as constant;

class SubmitFeedbackScreen extends StatelessWidget {
  Widget buildScreen() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 0.0),
      child: new Text("SubmitFeedback"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Submit Feedback')),
      drawer: AppDrawer(constant.Route.submitFeedback),
      body: Stack(
        children: <Widget>[
          buildScreen(),
        ],
      ),
    );
  }
}