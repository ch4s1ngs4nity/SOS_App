import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sos_app/services/auth.dart';
import 'package:sos_app/widgets/logo.dart';
import 'package:sos_app/constants.dart' as constant;

class LoginRegisterScreen extends GetWidget<AuthController> {
  //Passing the binded AuthController so we can use it below
  final TextEditingController emailController =
      TextEditingController(); //Controls state for email
  final TextEditingController passwordController =
      TextEditingController(); //Controls state for password

  /*
  If the below code is executed from another screen
    Get.toNamed(constant.Route.auth + '?type=Register&param2=abc&param3=etc');
  We will be brought to this screen and allows us to do the following here
    Get.parameters['type']; => Register
    Get.parameters['param2']; => abc
   */
  final String type = Get.parameters['type'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(type), //Write the app heading with the type passed
        ),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 60),
              logoWidget(),
              SizedBox(height: 20),
              TextFormField(
                autofocus: true,
                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.teal)),
                    labelText: 'Email'),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(constant.Limit.emailMaxSize)
                ],
                controller: emailController,
                onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.teal)),
                    labelText: 'Password'),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(
                      constant.Limit.passwordMaxSize)
                ],
                controller: passwordController,
                obscureText: true,
              ),
              RaisedButton(
                child: Text(type), //Write the button with the type passed
                onPressed: () {
                  Get.dialog(
                    Center(child: CircularProgressIndicator()),
                    barrierDismissible: false,
                  );

                  //Determine what to do when the button is clicked based on the type passed
                  if (type == 'Register') {
                    //controller is how we access the binded AuthController
                    controller.createUser(
                        emailController.text, passwordController.text);
                  } else {
                    //controller is how we access the binded AuthController
                    controller.login(
                        emailController.text, passwordController.text);
                  }
                },
              ),
            ],
          ),
        )));
  }
}
