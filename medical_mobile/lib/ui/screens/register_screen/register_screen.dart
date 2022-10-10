import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../utils/routes.dart';
import '../../common/my_button.dart';
import '../../common/my_input.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String email = "";
  String password = "";
  String gender = "male";
  int age = 16;
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
              InkWell(
                onTap: (() => Get.toNamed(loginRoute)),
                child: const Text("back"),
              ),
              MyInput(
                title: "email",
                onChanged: (text) {
                  email = text;
                },
              ),
              MyInput(
                title: "firstName",
                onChanged: (text) {
                  email = text;
                },
              ),
              MyInput(
                title: "lastName",
                onChanged: (text) {
                  email = text;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text("age: "),
                      ),
                      Slider(
                        label: "Select Age",
                        value: age.toDouble(),
                        onChanged: (value) {
                          setState(() {
                            age = value.toInt();
                          });
                        },
                        min: 16,
                        max: 100,
                      ),
                      Text(age.toString())
                    ],
                  ),
                ),
              ),
              MyInput(
                title: "password",
                onChanged: (text) {
                  password = text;
                },
                isHidden: true,
              ),
              MyButton(
                  text: "register", onPressed: () => Get.toNamed(newUserRoute)),
            ],
          ),
        )),
      ),
    );
  }
}
