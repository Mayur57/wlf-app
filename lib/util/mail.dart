import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SendMail {
    String platformResponse;
    String user_id;
  Future<void> mail(String name , String issue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
      user_id = prefs.getString('user_uid');
    String username = 'whatuplifefoundation@gmail.com';
    final Email email = Email(
      body: issue + '\n\n\nUnique User ID: ' + user_id,
      subject: 'Issue by: '+ name,
      recipients: [username],
      isHTML: false,
    );
    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
    } catch (error) {
      platformResponse = error.toString();
    }
    print(platformResponse);
  }
}