import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyInput extends StatefulWidget {
  final String? title;
  String? name;
  final Function(String)? onChanged;
  final TextInputType keyboardType;
  final bool? isHidden;
  final Icon? left;
  final Icon? right;
  final Color? myColor;
  String? text;
  MyInput({
    Key? key,
    this.title,
    this.onChanged,
    this.isHidden = false,
    this.keyboardType = TextInputType.text,
    this.left,
    this.right,
    this.myColor
  }) : super(key: key);

  @override
  State<MyInput> createState() => _MyInputState();
}

class _MyInputState extends State<MyInput> {
  bool _hasFocus = false;
  final FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      _hasFocus = _focusNode.hasFocus;
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    return (
        Container(
        color: const Color(0xA1FAFAFA),
        margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: widget.myColor,
                border: Border.all(
                  width: 1,
                  color: _hasFocus
                      ? Colors.black : Colors.grey
                      // : _userName.isEmpty
                      //     ? const Color.fromARGB(255, 244, 242, 242)
                      //     : Colors.black,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: TextField(
                style: const TextStyle(color: Colors.black),
                keyboardType: TextInputType.text,
                onChanged: widget.onChanged,
                focusNode: _focusNode,
                obscureText: widget.isHidden!,
                decoration: InputDecoration(
                    prefixIcon: widget.left,
                    suffixIcon: widget.right,
                    border: InputBorder.none,
                    hintText: widget.title,
                    fillColor: Colors.blue
                    // border: InputBorder.none,
                    ),
              ),
            ),
          ],
        )));
  }
}
