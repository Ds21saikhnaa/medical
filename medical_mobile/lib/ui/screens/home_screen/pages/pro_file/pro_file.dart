import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_mobile/utils/routes.dart';
import 'package:medical_mobile/utils/sp_manager.dart';

class ProFile extends StatefulWidget {
  const ProFile({Key? key}) : super(key: key);

  @override
  State<ProFile> createState() => _ProFileState();
}

class _ProFileState extends State<ProFile>
    with AutomaticKeepAliveClientMixin<ProFile> {
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
  String pro =
      "https://secure.gravatar.com/avatar/4b21ce3917fcb75324268ba4d3143c37?d=https%3A%2F%2Favatar-management--avatars.us-west-2.prod.public.atl-paas.net%2Fdefault-avatar-0.png";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("logo"),
                    Text("...")
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 18.0),
                  height: 200,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        margin: EdgeInsets.only(top: 18.0),
                        child: CachedNetworkImage(
                          imageUrl: pro,
                        ),
                      ),
                      Text("Andrew Ainsley"),
                      Text("+976 99991000"),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 18.0),
                  child: InkWell(
                    onTap: logOut,
                    child: const Text("log out",
                    style: TextStyle(color: Colors.red),),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
