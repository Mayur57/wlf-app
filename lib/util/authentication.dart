import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Services {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseMessaging _fcm = FirebaseMessaging();
  final _db = Firestore.instance;
  String status;
  FirebaseUser user;

  Future<String> signIn(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (result.user != null) {
        user = result.user;
        print("#######################################");
        print(user.uid);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('user_uid', user.uid);
        status = user.uid;
        print(status);
        String fcmToken = await _fcm.getToken();
        if (fcmToken != null) {
          var tokens = _db.collection('users').document(user.uid);

          await tokens.setData({
            'token': fcmToken,
          }, merge: true);
        }
        _db.collection("users").document(user.uid).get().then((value) {
          print(value.data["name"]);
          prefs.setString('name', value.data["name"]);
        });
      } else {
        status = "ERROR : Undefined error has occurred.Please retry.";
      }
    } catch (onError) {
      switch (onError.code) {
        case "ERROR_INVALID_EMAIL":
          status =
              "ERROR : Your email address appears to be malformed.Please retry.";
          break;
        case "ERROR_WRONG_PASSWORD":
          status = "ERROR : Your password is wrong.Please retry.";
          break;
        case "ERROR_USER_NOT_FOUND":
          status = "ERROR : User with this email doesn't exist.Please retry.";
          break;
        case "ERROR_USER_DISABLED":
          status =
              "ERROR : User with this email has been disabled.Please retry.";
          break;
        case "ERROR_TOO_MANY_REQUESTS":
          status = "ERROR : Too many requests. Try again later.Please retry.";
          break;
        case "ERROR_OPERATION_NOT_ALLOWED":
          status =
              "ERROR : Signing in with Email and Password is not enabled.Please retry.";
          break;
        default:
          status = "ERROR : An undefined Error happened.Please retry.";
      }
    }
    return status;
  }
/*
  Future<void>signOut(BuildContext context) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('email');
    await _auth.signOut().then((value){
      Navigator.of(context).pushReplacementNamed('/login');
    });
  }

 */
}
