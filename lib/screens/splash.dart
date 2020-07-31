import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_app/widgets/logo.dart';
import 'package:sos_app/constants.dart' as constant;

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: logoWidget(),
            alignment: Alignment.center,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Container(
              child: RaisedButton(
                child: const Text('Login'),
                onPressed: () => Get.toNamed(constant.Route.auth +
                    '?type=Login'), //Pass data to the next route
              ),
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
            ),
            Container(
              child: RaisedButton(
                child: const Text('Register'),
                onPressed: () => Get.toNamed(constant.Route.auth +
                    '?type=Register'), //Pass data to the next route
              ),
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
            )
          ]),
        ],
      ),
    );
  }
}
