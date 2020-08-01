import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_app/services/auth.dart';
import 'package:sos_app/widgets/logo.dart';

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
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              logoWidget(),
              SizedBox(height: 2),
              TextFormField(
                decoration: InputDecoration(hintText: "Email"),
                controller: emailController,
              ),
              SizedBox(
                height: 2,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Password"),
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
        ),
      ),
    );
  }
}
