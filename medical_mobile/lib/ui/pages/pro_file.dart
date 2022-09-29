import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

class ProFile extends StatefulWidget {
  const ProFile({Key? key}) : super(key: key);

  @override
  State<ProFile> createState() => _ProFileState();
}

class _ProFileState extends State<ProFile> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Text("profile page"),
      ),
    );
  }
}
