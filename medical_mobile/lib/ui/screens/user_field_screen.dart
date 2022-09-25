import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class UserFieldScreen extends StatefulWidget {
  const UserFieldScreen({Key? key}) : super(key: key);

  @override
  State<UserFieldScreen> createState() => _UserFieldScreenState();
}

class _UserFieldScreenState extends State<UserFieldScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(child: Text("user")),
    );
  }
}
