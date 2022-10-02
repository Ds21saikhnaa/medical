import 'package:flutter/material.dart';

class BubbleSpeciality extends StatelessWidget {
  final String? name;
  const BubbleSpeciality({Key? key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60 / 2),
          color: Colors.grey,
        ),
        child: Center(child: Text(name!)),
      ),
    );
  }
}
