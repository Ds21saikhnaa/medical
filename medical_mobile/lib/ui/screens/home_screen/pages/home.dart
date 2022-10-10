import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
//import 'package:get/get.dart';
import 'package:medical_mobile/ui/common/my_input.dart';
import 'package:medical_mobile/ui/screens/home_screen/pages/custom_banner.dart';
import 'package:medical_mobile/ui/screens/home_screen/pages/doctor_intro.dart';
import 'package:medical_mobile/ui/screens/home_screen/pages/speciality.dart';
import 'package:medical_mobile/utils/sp_manager.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin<Home> {
  final ValueNotifier<bool> _loading = ValueNotifier(true);
  String role = "";
  @override
  void initState() {
    super.initState();
    checkRole();
  }

  Future<String> roleMe() async {
    SpManager sharedPreference = SpManager();
    await sharedPreference.init();
    var myRole = await sharedPreference.getUserRole();
    return myRole;
  }

  void checkRole() async {
    SpManager sharedPreference = SpManager();
    await sharedPreference.init();
    var myRole = await sharedPreference.getUserRole();
    print(myRole);
    role = myRole;
    if (role != "")
      _loading.value = false;
    else
      print("emch shu");
  }

  String pro =
      "https://secure.gravatar.com/avatar/4b21ce3917fcb75324268ba4d3143c37?d=https%3A%2F%2Favatar-management--avatars.us-west-2.prod.public.atl-paas.net%2Fdefault-avatar-0.png";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.white30,
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 40,
                          height: 40,
                          child: CachedNetworkImage(
                            imageUrl: pro,
                          ),
                        ),
                      ),
                      const Text("name bn shu "),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: const [
                            Icon(Icons.notifications),
                            Icon(Icons.favorite),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                MyInput(title: "search", left: Icon(Icons.search)),
                const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: SizedBox(
                      child: CustomBanner(),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Doctor Speciality",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(color: Colors.indigoAccent),
                    )
                  ],
                ),
                ValueListenableBuilder(
                  valueListenable: _loading,
                  builder: (_, bool value, __) {
                    return value
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : SizedBox(
                            child: role == "user"
                                ? Speciality()
                                : Text("emch ym bishude"));
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Top Doctor",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(color: Colors.indigoAccent),
                    )
                  ],
                ),
                DoctorIntro(),
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
