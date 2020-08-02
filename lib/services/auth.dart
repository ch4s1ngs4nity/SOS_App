import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sos_app/models/user.dart';
import 'package:sos_app/services/database.dart';
import 'package:sos_app/constants.dart' as constant;

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance; //Entry into firebase auth
  Rx<FirebaseUser> _firebaseUser = Rx<FirebaseUser>(); //Observable firebase user object

  String get email => _firebaseUser.value?.email; //This will automatically be updated as the auth state changes
  String get uid => _firebaseUser.value?.uid; //This will automatically be update as the auth state changes

  @override
  onInit() {
    //This binds the user object to auth state changes.
    //As the auth state changes the firebase user will now reflect those changes
    _firebaseUser.bindStream(_auth.onAuthStateChanged);
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
      UserModel user = UserModel(id: this.uid, email: this.email);
      await Database().writeUser(user);

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
  bool isError = e is Error;
  String data = isError ? e.message : e;

  Get.snackbar(
    title,
    data,
    snackPosition: SnackPosition.BOTTOM,
  );
}