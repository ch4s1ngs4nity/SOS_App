import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_app/services/database.dart';

class FeedbackController extends GetxController{
  List<DocumentSnapshot> items = <DocumentSnapshot>[]; //Feedback documents returned in most recent query

  /*
  Runs the premade database query to pull in all feedback documents
  Saves the returned documents to the controller List of items
  Notifies anyone listening to this controller there was an update
   */
  Future<void> refreshFeedback() async {
    await Database().readFeedback().then((QuerySnapshot snapshot) {
      items = snapshot.documents; //Save the documents for future use
      update(); //Notify any listeners there are changes to a rebuild is triggered
    });
  }

  /*
  This does the same as refreshFeedback but shows a loading spinner until it completes
   */
  Future<void> refreshWithLoadingScreen() async{
    //Show the progress indicator
    Get.dialog(
      Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );

    await refreshFeedback(); //Goes and gets the latest feedback documents

    Get.back(); //Close the progress indicator
  }

  /*
  This logs the current feedback items to the console
   */
  void log(){
    items.forEach((element) {print(element.data);});
  }

  /*
  This method triggers once when the feedback controller is initialized.
   */
  @override
  void onInit() {
    refreshFeedback();
    super.onInit();
  }
}
