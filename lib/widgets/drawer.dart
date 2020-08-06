import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_app/services/auth.dart';
import 'package:sos_app/constants.dart' as constant;

class AppDrawer extends GetWidget<AuthController> {
  AppDrawer(this.currentPage);

  /*
  This drawer is really just a widget displayed by screens like profile/settings/etc
  When we open the drawer we pass it the parent screen that way the drawer knows what the state of the app is
   */
  final String currentPage;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text(controller.userModel.getNameOrUID()),
          accountEmail: Text(controller.email),
          //Using the binded AuthController to get the current user email
          currentAccountPicture: CircleAvatar(
            child: Image.asset(constant.Image.logo),
          ),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text("Home"),
          onTap: () {
            drawerOpen(constant.Route.home);
          },
        ),
        ListTile(
          leading: Icon(Icons.portrait),
          title: Text("Profile"),
          onTap: () {
            drawerOpen(constant.Route.profile);
          },
        ),
        ListTile(
          leading: Icon(Icons.list),
          title: Text("View Feedback"),
          onTap: () {
            drawerOpen(constant.Route.viewFeedback);
          },
        ),
        ListTile(
          leading: Icon(Icons.feedback),
          title: Text("Submit Feedback"),
          onTap: () {
            drawerOpen(constant.Route.submitFeedback);
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.power_settings_new),
          title: Text("Logout"),
          onTap: () {
            drawerOpen(constant.Route.logout);
          },
        ),
        Divider(),
        Expanded(
            child: Align(
          alignment: FractionalOffset.bottomCenter,
          child: ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () {
              drawerOpen(constant.Route.settings);
            },
          ),
        ))
      ],
    ));
  }

  /*
  Handles navigation using the drawer
   */
  void drawerOpen(String target) {
    //Don't do anything if someone clicks on the location we are at
    if (this.currentPage == target) {
      Get.back(); //Closes drawer
      return; //Don't process anything more code in this method
    }

    //Check for the special route of logout otherwise navigate to the passed route
    if (target == constant.Route.logout) {
      Get.defaultDialog(
        title: "",
        middleText: "Are you sure?",
        actions: [
          new FlatButton(
            color: Colors.red[100],
            child: const Text("Logout"),
            onPressed: doLogout,
          ),
          new FlatButton(
            color: Colors.blue[100],
            child: const Text("Cancel"),
            onPressed: Get.back,
          ),
        ],
      );

    } else {
      Get.offAllNamed(target); //Remove all previous routes and navigate to new route.
    }
  }

  void doLogout(){
    //Show loading spinner
    Get.dialog(
      Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );

    controller.signOut(); //Signout out of firebase authentication
  }
}

