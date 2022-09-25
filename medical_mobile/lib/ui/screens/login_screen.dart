import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_mobile/ui/common/my_button.dart';
import 'package:medical_mobile/ui/common/my_input.dart';

import '../../utils/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 168),
                  // color: Colors.grey,
                  child: const Text(
                    "log in",
                    style: TextStyle(fontSize: 48),
                  ),
                  //child: Image.asset("assets/images/Logo.png"),
                ),
                MyInput(
                  title: "email",
                  onChanged: (text) {
                    email = text;
                  },
                ),
                MyInput(
                  title: "password",
                  onChanged: (text) {
                    password = text;
                  },
                  isHidden: true,
                ),
                MyButton(
                  text: "Log in",
                  onPressed: () => Get.toNamed(registerRoute),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 100, top: 50),
                  child: Row(
                    children: [
                      const Text("Don't have an account?",
                          style: TextStyle(color: Colors.grey)),
                      InkWell(
                        onTap: () {
                          Get.toNamed(registerRoute);
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            "Sign up.",
                            style: TextStyle(color: Color(0xFF3797EF)),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
