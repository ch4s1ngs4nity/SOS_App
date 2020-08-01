import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_app/widgets/drawer.dart';
import 'package:sos_app/constants.dart' as constant;
import 'package:sos_app/services/database.dart';

class SubmitFeedbackScreen extends StatelessWidget {
  final TextEditingController feedbackController =
      TextEditingController(); //Controls state for feedback

  Widget textBox() {
    return new TextField(
      maxLines: 12,
      controller: feedbackController,
      decoration: new InputDecoration(
          border: new OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.teal)),
          //hintText: 'Feedback',
          labelText: 'Feedback',
          helperText: 'This feedback is not yet anonymous',
          suffixStyle: const TextStyle(color: Colors.green)),
    );
  }

  Widget submitButton() {
    return RaisedButton(
        child: Text("Submit"),
        onPressed: () {
          Get.dialog(
            Center(child: CircularProgressIndicator()),
            barrierDismissible: false,
          );
          Database().submitFeedback(feedbackController.text);
        });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Submit Feedback')),
      drawer: AppDrawer(constant.Route.submitFeedback),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              textBox(),
              SizedBox(height: 10),
              submitButton()
            ],
          ),
        ),
      ),
    );
  }
}
