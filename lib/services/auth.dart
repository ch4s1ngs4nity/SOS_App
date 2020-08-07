import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sos_app/models/user.dart';
import 'package:sos_app/services/database.dart';
import 'package:sos_app/constants.dart' as constant;

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance; //Entry into firebase auth
  Rx<FirebaseUser> _firebaseUser = Rx<FirebaseUser>(); //Observable firebase user object
  UserModel userModel; //Stores the more detailed user info

  String get email => _firebaseUser.value?.email; //This will automatically be updated as the auth state changes
  String get uid => _firebaseUser.value?.uid; //This will automatically be update as the auth state changes

  @override
  onInit() async {
    //This binds the user object to auth state changes.
    //As the auth state changes the firebase user will now reflect those changes
    _firebaseUser.bindStream(_auth.onAuthStateChanged);

    /*
    There is no event fired if a user is auto-logged in but we can wait for the currentUser to resolve and check for a uid.
    If we get a uid and have no UserModel we no the auto-login occurred.
    We can then load the corresponding UserModel from the database with the uid.
     */
    await _auth.currentUser();
    if (userModel == null && uid != null){
      var tempUser = await Database().readUser(uid);
      this.userModel = tempUser;
    }
  }

  /*
  Updates the user model after determining the usermodel exists.
   */
  void updateUser(String name, String flight) async{
    try {
      await userModel.updateData(name, flight);

      Get.back(); //Closes the loading progress circle
      inform("Success!", "Profile updated");
    } catch(e){
      Get.back(); //Closes the loading progress circle
      inform("Error updating profile", e);
    }
  }

  /*
  1. Creates a user using firebase auth
  2. Creates a firestore entry under the collection users tracking this new user
   */
  void createUser(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);

      //Saving the user to the firestore database
      this.userModel = UserModel(uid: this.uid, email: this.email);
      await Database().writeUser(this.userModel);

      Get.offAllNamed(constant.Route.root); //Re check if the user is authenticated
    } catch (e) {
      Get.back(); //Closes the loading progress circle
      inform("Error creating account", e);
    }
  }

  /*
  Attempts to login using firebase auth with the supplied username and password
   */
  void login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);
      var tempUser = await Database().readUser(uid);
      this.userModel = tempUser;

      Get.offAllNamed(constant.Route.root); //Re check if the user is authenticated
    } catch (e) {
      Get.back(); //Closes the loading progress circle
      inform("Error signing in", e);
    }
  }

  /*
  Logs the current user out of firebase
   */
  void signOut() async {
    try {
      await _auth.signOut();
      Get.offAllNamed(constant.Route.root); //Re check if the user is authenticated
    } catch (e) {
      Get.back();
      inform("Error signing out", e);
    }
  }
}

/*
If errors occur, display them in a nice format
 */
void inform(String title, e) {
  bool isError = e is Error || e is PlatformException; //Is the message an instance of the Error or PlatformException class?
  String data = isError ? e.message : e; //Either use the string passed on e or access the message the e  Error object contains

  Get.snackbar(
    title,
    data,
    snackPosition: SnackPosition.BOTTOM,
  );
}