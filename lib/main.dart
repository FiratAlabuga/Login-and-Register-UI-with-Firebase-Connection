import 'package:flutter/material.dart';
import 'package:self_tracking_sys_sts/screens/log_page.dart';
import 'package:self_tracking_sys_sts/screens/login_page.dart';
import 'package:self_tracking_sys_sts/screens/welcome_page.dart';
import 'services/auth.dart';
import 'services/root_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.amber,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: RootPage(auth: new Auth()),
    );
  }
}
