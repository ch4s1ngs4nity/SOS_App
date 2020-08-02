import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:sos_app/services/database.dart';

class FeedbackController extends GetxController{
  List<DocumentSnapshot> items = <DocumentSnapshot>[];

  refreshFeedback() async {
    await Database().readFeedback().then((QuerySnapshot snapshot) {
      items = snapshot.documents;
      print(items);
      update();
    });
  }

  Future<void> pullToRefresh() async{
    refreshFeedback();
  }

  @override
  void onInit() {
    refreshFeedback();
    super.onInit();
  }
}
