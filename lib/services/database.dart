import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:sos_app/models/user.dart';
import 'package:sos_app/constants.dart' as constant;

class Database {
  final Firestore _firestore = Firestore.instance; //Entry point to the firebase database

  /*
  Takes a UserModel and writes it to the database. Returns if it was a success
   */
  Future<bool> writeUser(UserModel user) async {
    try {
      await _firestore.collection("users").document(user.id).setData({
        "id": user.id,
        "email": user.email,
      });
      return true;
    } catch (e) {
      inform(e, "Error writing user to firestore");
      return false;
    }
  }

  /*
  Writes feedback to the database
   */
  Future<bool> submitFeedback(String data) async {
    try {
      await _firestore.collection("feedback").document().setData({
        "user": null,
        "email": null,
        "feedback": data,
      });
      Get.offAllNamed(constant.Route.home);
      inform('Thank you for making SOS better', 'Feedback Submitted');
      return true;
    } catch (e) {
      inform(e, "Error writing user to firestore");
      return false;
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
      inform(e, "Error reading user from firestore");
      rethrow;
    }
  }
}

/*
If errors occur, display them in a nice format
 */
void inform(e, String msg) {
  bool isError = e is Error;
  String data = isError ? e.message : e;

  Get.snackbar(
    msg,
    data,
    snackPosition: SnackPosition.BOTTOM,
  );
}
