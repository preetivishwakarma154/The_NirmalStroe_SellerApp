import 'package:flutter/material.dart';

import 'constant.dart';


class InputBox extends StatefulWidget {


 InputBox({Key? key, required this.controller, required this.hintText, this.prefixIconn,this.saffix, required this.textInputType,this.function,this.validator
 }) : super(key: key);
  final TextEditingController controller;
  final String hintText;
  var prefixIconn;
  var saffix;
  var function;
  var validator;

  final TextInputType textInputType;
  @override
  State<InputBox> createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {
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
          validator: widget.validator,
          decoration: InputDecoration(
              prefixIcon: Icon(
                widget.prefixIconn,
                color: focusNode.hasFocus ? ThemeColorYellow : ThemeColortext,
              ),
              hintText: widget.hintText,

              //suffix: widget.saffix,
              suffixIcon: widget.saffix,
              hintStyle: TextStyle(
                fontSize: 12,
              ),
              prefix: SizedBox(
                height: 20,
              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: ThemeColoricon)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ThemeColorYellow))
          ),
        ),
      ),
    );
  }
}

