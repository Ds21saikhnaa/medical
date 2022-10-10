import 'package:flutter/material.dart';
import 'package:medical_mobile/ui/common/bubble_speciality.dart';

class Speciality extends StatefulWidget {
  const Speciality({Key? key}) : super(key: key);
  @override
  State<Speciality> createState() => _SpecialityState();
}

class _SpecialityState extends State<Speciality> {
  List spe = ["dent", "bla", "heart", "eye"];
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: spe.length,
        itemBuilder: (context, index) {
            return BubbleSpeciality(name: spe[index],);
          // Text(spe[index]);
            //Stories(name: widget.people[index]);
        },
      ),
    );
  }
}
