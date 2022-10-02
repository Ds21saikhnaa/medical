import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_mobile/apis/rest_api.dart';
import 'package:medical_mobile/ui/common/my_button.dart';
import 'package:medical_mobile/ui/common/my_input.dart';

import '../../utils/routes.dart';
import '../../utils/sp_manager.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = "";
  String password = "";
  RestApi _restApi = RestApi();

  void _login() async {
    var res = await _restApi.login({"email": email, "password": password});
    var conToken = res.data['token'];
    var role = res.data["user"]["role"];
    if (res.success == true) {
      SpManager sharedPreference = SpManager();
      await sharedPreference.init();
      sharedPreference.saveAccessToken(conToken);
      sharedPreference.saveRole(role);
      Get.offAllNamed(homeRoute, arguments: {"role": "role"} );
    }
  }

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
                    onPressed: _login //() => Get.toNamed(registerRoute),
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
