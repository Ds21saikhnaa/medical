import 'package:flutter/material.dart';

class CustomBanner extends StatefulWidget {
  const CustomBanner({Key? key}) : super(key: key);

  @override
  State<CustomBanner> createState() => _CustomBannerState();
}

class _CustomBannerState extends State<CustomBanner> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
        decoration: BoxDecoration(
          color: Colors.indigoAccent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 14),
                  child: Text("Medical Checks!",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 28.0, top: 20),
                  child: Container(
                    width: 250,
                    // color: Colors.grey,
                    child:
                    const Text("Check your health condition regularly to minimize the incidence of disiese in the future",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, left: 100),
                  height: 25,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                      child: Text("Check Now",
                        style: TextStyle(color: Colors.indigoAccent),
                      ),
                  ),
                )
              ],
            )
          ],
        ),
      );
  }
}
