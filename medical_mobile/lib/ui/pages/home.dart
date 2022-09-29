import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:medical_mobile/ui/common/my_input.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: CachedNetworkImage(
                          imageUrl: pro,
                          // placeholder: (context, url) =>
                          // const CircularProgressIndicator(),
                          // fit: BoxFit.cover,
                          // height: 40,
                          // width: double.infinity,
                        ),
                      ),
                      Text("name bn shu "),

                      Row(
                        children:const [
                          Icon(Icons.notifications),
                          Icon(Icons.favorite),
                        ],
                      ),
                    ],
                  ),
                ),
                MyInput(title: "search"),
                Center(child: Text("home page")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
