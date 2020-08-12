import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wlf/util/authentication.dart';
import 'package:wlf/util/mail.dart';
import 'package:wlf/util/scaler.dart';
import 'package:get_it/get_it.dart';
import 'config/routes.dart';

GetIt locator = GetIt.instance;
String e;
String user_id;
void setupSingletons() async {
  locator.registerLazySingleton<Services>(() => Services());
  locator.registerLazySingleton<SendMail>(() => SendMail());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  e = prefs.getString('email');
  user_id = prefs.getString('user_uid');
  setupSingletons();
  runApp(MyApp());
}

Color bg = Color(0xffF8BC4E);

//Introduction page
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().initScaler(constraints, orientation);
        return MaterialApp(
          initialRoute: e == null ? '/login' : '/test',
          onGenerateRoute: RouteGenerator.generateRoute,
          debugShowCheckedModeBanner: false,
        );
      });
    });
  }
}
