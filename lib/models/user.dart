import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:sos_app/services/database.dart';

class UserModel extends GetxController {
  //uid and email are determined by the firebase auth. The current method of changing a email is to re-register.
  String uid;
  String email;

  //These fields can be changed by the user without re-registering
  String name;
  String flight;

  /*
  This is a generic constructor. When a user first signs up we don't ask for name or flight so we can create the user in this basic manner.
   */
  UserModel({this.uid, this.email});

  /*
  Returns the user name if it exists otherwise the UID
   */
  String getNameOrUID(){
    return (this.name != null && this.name != '') ? this.name : this.uid;
  }

  /*
  This is a constructor to create a UserModel from the result of a firebase document
   */
  UserModel.fromDocumentSnapshot({DocumentSnapshot documentSnapshot}) {
    uid = documentSnapshot.documentID; //This works because the documentID was set to be the UID at creation
    email = documentSnapshot["email"];
    name = documentSnapshot["name"];
    flight = documentSnapshot["flight"];
  }

  /*
  Provides a means to update the user data
   */
  Future updateData(String name, String flight) async{
    //Do not update email or uid. If you do you will break the auth to user relationship
    this.name = name;
    this.flight = flight;
    Database().writeUser(this);
  }

}
