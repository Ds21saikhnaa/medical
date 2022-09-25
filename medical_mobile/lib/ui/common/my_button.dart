import 'package:flutter/material.dart';
import 'package:medical_mobile/utils/styles.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

class MyButton extends StatefulWidget {
  final String? text;
  final Function()? onPressed;
  const MyButton({Key? key, this.text, this.onPressed}) : super(key: key);
  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  final _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: MaterialButton(
        elevation: 0,
        onPressed: widget.onPressed,
        child: Container(
          height: buttonHeight,
          width: double.infinity,
          alignment: Alignment.center,
          // ignore: sort_child_properties_last
          child:
              Text(widget.text!, style: const TextStyle(color: Colors.white)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: _isSelected
                ? const Color.fromARGB(255, 213, 140, 135)
                : const Color(0xFF3797EF),
          ),
        ),
      ),
    );
  }
}
