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
                Text("Medical Checks!"),
                Container(
                  width: 250,
                  color: Colors.grey,
                  child:
                  Text("Check your health condition regularly to minimize the incidence of disiese in the future"),
                ),
                Container(
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
