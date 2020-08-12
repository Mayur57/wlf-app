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
        status = "ERROR: An unknown error has occurred. Please try again.";
      }
    } catch (onError) {
      switch (onError.code) {
        case "ERROR_INVALID_EMAIL":
          status =
              "ERROR: Your email address appears to be invalid. Please try again.";
          break;
        case "ERROR_WRONG_PASSWORD":
          status = "ERROR: Incorrect password.";
          break;
        case "ERROR_USER_NOT_FOUND":
          status = "ERROR: User with this email doesn't exist. Please try again.";
          break;
        case "ERROR_USER_DISABLED":
          status =
              "ERROR: User with this email has been disabled. Please contact the administrator.";
          break;
        case "ERROR_TOO_MANY_REQUESTS":
          status = "ERROR: Too many requests. Please try again after some time.";
          break;
        case "ERROR_OPERATION_NOT_ALLOWED":
          status =
              "ERROR: Signing in with these set of credentials is not enabled or allowed. Please contact the administrator.";
          break;
        default:
          status = "ERROR: An unknown error has occurred. Please try again.";
      }
    }
    return status;
  }
}
