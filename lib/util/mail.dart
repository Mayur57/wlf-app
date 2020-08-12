import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:get_it/get_it.dart';
import '../util/authentication.dart';

class SendMail {
  Services _services = GetIt.I.get<Services>();
  Future<void> mail(String name , String issue) async {
    String username = 'vertotheapp@gmail.com';
    String password = 'worlddomination';
    final smtpServer = gmail(username, password);
    final message = Message()
      ..from = Address(username)
      ..recipients.add(username)
      ..subject = 'Issue by:'+ name
      ..text = issue + '\nuid:' + _services.status;

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