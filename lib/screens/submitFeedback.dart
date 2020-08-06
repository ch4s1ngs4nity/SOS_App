import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_app/widgets/drawer.dart';
import 'package:sos_app/constants.dart' as constant;
import 'package:sos_app/services/database.dart';

bool isAnon = false;

class SubmitFeedbackScreen extends StatelessWidget {
  final TextEditingController feedbackController =
      TextEditingController(); //Controls state for feedback

  Widget textBox() {
    return new TextField(
      autofocus: true,
      maxLines: 12,
      maxLength: constant.Limit.feedbackSize,
      controller: feedbackController,
      decoration: new InputDecoration(
          border: new OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.teal)),
          //hintText: 'Feedback',
          labelText: 'Feedback',
          helperText: ''),
    );
  }

  Widget submitButton() {
    return RaisedButton(
        child: Text("Submit"),
        onPressed: () {
          if (feedbackController.text.length >= constant.Limit.minFeedbackSize) {
            Get.dialog(
              Center(child: CircularProgressIndicator()),
              barrierDismissible: false,
            );
            Database().submitFeedback(feedbackController.text, isAnon);
          } else {
            //May need to debounce this... App slows if you spam submit in this case
            Get.snackbar(
              'Please tell us more',
              'You wrote less than a tweet... (${constant.Limit.minFeedbackSize} characters)',
              snackPosition: SnackPosition.BOTTOM,
            );
          }
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
              SwitchButton(),
              submitButton()
            ],
          ),
        ),
      ),
    );
  }
}

class SwitchButton extends StatefulWidget {
  SwitchButton({Key key}) : super(key: key);

  @override
  _SwitchButtonState createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  bool switchStatus = false;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: SwitchListTile(
      title: Text((switchStatus) ? 'Anonymous Feedback' : 'Public Feedback'),
      value: switchStatus,
      onChanged: (bool value) {
        isAnon = value;
        setState(() {
          switchStatus = value;
        });
      },
      secondary: Icon((switchStatus) ? Icons.visibility_off : Icons.visibility),
    ));
  }
}
