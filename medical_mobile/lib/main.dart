import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:medical_mobile/ui/screens/home_screen.dart';
import 'package:medical_mobile/ui/screens/login_screen.dart';
import 'package:medical_mobile/ui/screens/user_field_screen.dart';
import 'package:medical_mobile/utils/routes.dart';

import 'ui/screens/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: loginRoute,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.grey),
      routes: <String, WidgetBuilder>{
        loginRoute: (context) => const LoginScreen(),
        registerRoute: (context) => const RegisterScreen(),
        newUserRoute: (context) => const UserFieldScreen(),
        homeRoute: (context) => const HomeScreen()
      },
    );
  }
}
