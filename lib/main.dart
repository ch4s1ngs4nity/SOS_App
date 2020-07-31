import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_app/screens/home.dart';
import 'package:sos_app/screens/profile.dart';
import 'package:sos_app/screens/settings.dart';
import 'package:sos_app/screens/splash.dart';
import 'package:sos_app/screens/loginRegister.dart';
import 'package:sos_app/screens/submitFeedback.dart';
import 'package:sos_app/screens/viewFeedback.dart';
import 'package:sos_app/services/auth.dart';
import 'package:sos_app/constants.dart' as constant;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialBinding: AppBindings(),
        //Makes the AuthController available to the entire application
        home: Root(),
        //Controls where we initially go when the app opens
        getPages: [
          //Routes that can be navigated to
          GetPage(name: constant.Route.root, page: () => Root()),
          GetPage(name: constant.Route.splash, page: () => SplashScreen()),
          GetPage(name: constant.Route.auth, page: () => LoginRegisterScreen()),
          GetPage(name: constant.Route.settings, page: () => SettingsScreen()),
          GetPage(name: constant.Route.home, page: () => HomeScreen()),
          GetPage(
              name: constant.Route.submitFeedback,
              page: () => SubmitFeedbackScreen()),
          GetPage(
              name: constant.Route.viewFeedback,
              page: () => ViewFeedbackScreen()),
          GetPage(name: constant.Route.profile, page: () => ProfileScreen()),
        ]);
  }
}

/*
Looks for an existing AuthController
If it finds an AuthController with a valid user it directs to the authenticated side of the app
Otherwise it sends the user to authenticate
 */
class Root extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthController>().email != null)
          ? HomeScreen()
          : SplashScreen();
    });
  }
}

/*
Creates an instance of the AuthController as soon as it's required and makes it available to the top level of the application
 */
class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
