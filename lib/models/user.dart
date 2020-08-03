import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class UserModel extends GetxController {
  String id;
  String email;

  /*
  This is a generic constructor
   */
  UserModel({this.id, this.email});

  /*
  This is a constructor to create a UserModel from the result of a firebase document
   */
  UserModel.fromDocumentSnapshot({DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.documentID;
    email = documentSnapshot["email"];
  }
}
