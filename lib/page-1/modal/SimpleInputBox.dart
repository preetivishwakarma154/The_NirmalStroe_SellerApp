import 'package:flutter/material.dart';

import 'constant.dart';

class SimpleInputBox extends StatefulWidget {
  SimpleInputBox(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.textInputType})
      : super(key: key);
  final TextEditingController controller;
  final String hintText;

  final TextInputType textInputType;
  @override
  State<SimpleInputBox> createState() => _SimpleInputBoxState();
}

class _SimpleInputBoxState extends State<SimpleInputBox> {
  late FocusNode focusNode = FocusNode()
    ..addListener(() {
      setState(() {});
    });

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.99,
      child: Container(
        margin: EdgeInsets.only(
          bottom: 15,
          top: 8,
        ),
        height: 35,
        child: TextFormField(
          controller: widget.controller,
          keyboardType: widget.textInputType,
          focusNode: focusNode,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                left: 12,
              ),
              hintText: widget.hintText,
              hintStyle: TextStyle(
                fontSize: 12,
              ),
              prefix: SizedBox(
                height: 20,
              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: ThemeColoricon)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ThemeColorYellow))),
        ),
      ),
    );
  }
}
