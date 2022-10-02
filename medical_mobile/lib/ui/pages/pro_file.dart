import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/routes.dart';
import '../../utils/sp_manager.dart';

class ProFile extends StatefulWidget {
  const ProFile({Key? key}) : super(key: key);

  @override
  State<ProFile> createState() => _ProFileState();
}

class _ProFileState extends State<ProFile> with AutomaticKeepAliveClientMixin<ProFile> {
  @override
  void initState() {
    super.initState();
    print("profile");
  }
  void logOut() async {
    SpManager sharedPreference = SpManager();
    await sharedPreference.init();
    sharedPreference.delete();
    Get.offAllNamed(loginRoute);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: logOut,
          child: const Text("profile page"),
        ),
      ),
    );
  }
  @override
  bool get wantKeepAlive => true;
}
