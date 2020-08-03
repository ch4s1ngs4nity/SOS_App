import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_app/services/database.dart';

class FeedbackController extends GetxController{
  List<DocumentSnapshot> items = <DocumentSnapshot>[];

  Future<void> refreshFeedback() async {
    await Database().readFeedback().then((QuerySnapshot snapshot) {
      items = snapshot.documents;
      update();
    });
  }

  Future<void> pullToRefresh() async{
    Get.dialog(
      Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );

    await refreshFeedback();

    Get.back();
  }

  void log(){
    items.forEach((element) {print(element.data);});
  }

  @override
  void onInit() {
    refreshFeedback();
    super.onInit();
  }
}
