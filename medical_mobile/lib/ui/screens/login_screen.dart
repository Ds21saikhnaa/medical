import 'package:flutter/material.dart';
import 'package:medical_mobile/ui/common/my_button.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
            //width: 100,
            color: Colors.white,
            child: Column(
              children: [
                MyButton(
                  text: "Log in",
                  onPressed: () => print("hello"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
