import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:sos_app/models/user.dart';
import 'package:sos_app/constants.dart' as constant;
import 'package:sos_app/services/auth.dart';

class Database {
  final Firestore _firestore = Firestore.instance; //Entry point to the firebase database

  /*
  Takes a UserModel and writes it to the database. Returns if it was a success
   */
  Future<bool> writeUser(UserModel user) async {
    try {
      await _firestore.collection("users").document(user.uid).setData({
        "id": user.uid,
        "email": user.email,
        "name": user.name,
        "flight": user.flight
      });
      return true;
    } catch (e) {
      inform("Error writing user to firestore", e);
      return false;
    }
  }

  /*
  Writes feedback to the database
   */
  Future<bool> submitFeedback(String data) async {

    AuthController authController = Get.put(AuthController());

    try {
      await _firestore.collection("feedback").document().setData({
        "timestamp": new Timestamp.now(),
        "uid": authController.uid, //Need to integrate the userModel
        "email": authController.email, //Need to integrate the userModel
        "feedback": data,
        "name": authController.userModel.name,
        "flight": authController.userModel.flight
      });
      Get.offAllNamed(constant.Route.home);
      inform('Feedback Submitted', 'Thank you for making SOS better');
      return true;
    } catch (e) {
      inform("Error writing user to firestore", e);
      return false;
    }
  }

  /*
  Requests all feedback documents from the database and sorts them in descending order by timestamp.
  Newest feedback will be on top on the viewFeedback page.
   */
  Future <QuerySnapshot> readFeedback() async {
    try {
      QuerySnapshot _doc = await _firestore.collection("feedback").orderBy('timestamp', descending: true).getDocuments();

      return _doc;
    } catch (e) {
      inform("Error reading feedback from firestore", e);
      rethrow;
    }
  }


  /*
  Takes a userID and returns a UserModel if that userID exists in the database
   */
  Future<UserModel> readUser(String uid) async {
    try {
      DocumentSnapshot _doc =
          await _firestore.collection("users").document(uid).get();

      return UserModel.fromDocumentSnapshot(documentSnapshot: _doc);
    } catch (e) {
      inform("Error reading user from firestore", e);
      rethrow;
    }
  }
}

/*
If errors occur, display them in a nice format
 */
void inform(String title, e) {
  bool isError = e is Error;
  String data = isError ? e.message : e;

  Get.snackbar(
    title,
    data,
    snackPosition: SnackPosition.BOTTOM,
  );
}
