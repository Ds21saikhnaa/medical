import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:medical_mobile/apis/rest_api_client.dart';
import 'package:medical_mobile/ui/screens/home_screen/home_screen.dart';
import 'package:medical_mobile/ui/screens/login_screen/login_screen.dart';
import 'package:medical_mobile/ui/screens/splash_screen/splash_screen.dart';
import 'package:medical_mobile/ui/screens/user_field/user_field_screen.dart';
import 'package:medical_mobile/utils/routes.dart';

import 'ui/screens/register_screen/register_screen.dart';

void main() {
  RestApiClient.init(baseUrl: 'http://localhost:3000/');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String role;
    return GetMaterialApp(
      // initialRoute: splashRoute,
      initialRoute: homeRoute,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.grey),
      routes: <String, WidgetBuilder>{
        splashRoute: (context) => const SplashScreen(),
        loginRoute: (context) => const LoginScreen(),
        registerRoute: (context) => const RegisterScreen(),
        newUserRoute: (context) => const UserFieldScreen(),
        homeRoute: (context) => const HomeScreen()
      },
    );
  }
}
