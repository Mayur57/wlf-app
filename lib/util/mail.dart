import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:wlf/main.dart';

class SendMail {
  Future<void> mail(String name , String issue) async {
    String username = 'vertotheapp@gmail.com';
    String password = 'worlddomination';

    final smtpServer = gmail(username, password);
    // Use the SmtpServer class to configure an SMTP server:
    // final smtpServer = SmtpServer('smtp.domain.com');
    // See the named arguments of SmtpServer for further configuration
    // options.

    // Create our message.
    final message = Message()
      ..from = Address(username)
      ..recipients.add(username)
      ..subject = 'Issue by:'+ name
      ..text = issue + '\nuid:' + user_id;

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }
}