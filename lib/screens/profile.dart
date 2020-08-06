import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sos_app/services/auth.dart';
import 'package:sos_app/widgets/drawer.dart';
import 'package:sos_app/constants.dart' as constant;

class ProfileScreen extends GetWidget<AuthController> {
  //Passing the binded AuthController so we can use it below
  final TextEditingController nameController = TextEditingController(); //Controls state for name
  final TextEditingController flightController = TextEditingController(); //Controls state for flight
  final TextEditingController emailController = TextEditingController(); //Controls state for email
  final TextEditingController uidController = TextEditingController(); //Controls state for uid

  Widget buildScreen() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            autofocus: true,
            decoration: new InputDecoration(
                border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.teal)),
                labelText: 'Name'),
            inputFormatters: [LengthLimitingTextInputFormatter(constant.Limit.nameSize)], //How long of a name do we need lol
            controller: nameController..text = controller.userModel.name, //This sets the controller and specifies the initial value for the field
            //controller: nameController..text is the equivalent of controller: nameController and then specifying nameController.text = '';
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: new InputDecoration(
                border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.teal)),
                labelText: 'Flight'),
            inputFormatters: [LengthLimitingTextInputFormatter(constant.Limit.flightSize)], //Limit the field to 4 characters (eg. F065)
            controller: flightController..text = controller.userModel.flight, //This sets the controller and specifies the initial value for the field
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            style: TextStyle(
                color: Colors.grey
            ),
            decoration: new InputDecoration(
                border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.teal)),
                labelText: 'Email'),
            controller: emailController..text = controller.userModel.email, //This sets the controller and specifies the initial value for the field
            enabled: false,
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            style: TextStyle(
              color: Colors.grey
            ),
            decoration: new InputDecoration(
                border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.teal)),
                labelText: 'uid'),
            controller: uidController..text = controller.userModel.uid, //This sets the controller and specifies the initial value for the field
            enabled: false,
          ),
          RaisedButton(
            child: Text('Update'), //Write the button with the type passed
            onPressed: () async {
              Get.dialog(
                Center(child: CircularProgressIndicator()),
                barrierDismissible: false,
              );
              controller.updateUser(nameController.text.trim(), flightController.text.trim());
            },
          ),
        ],
      ),
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
