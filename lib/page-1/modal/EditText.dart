import 'package:flutter/material.dart';

import 'constant.dart';
class editText extends StatelessWidget {
  const editText({
    super.key,
    required this.productNameController,
    required this.heading,
    required this.width,
    required this.inputBoxWidth, required this.textInputType,
  });

  final TextEditingController productNameController;
  final String heading;
  final double width, inputBoxWidth;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return Container(

      height: 28,
      width: MediaQuery.of(context).size.width * width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: headingtextStyle,
          ),
          Container(
            width: MediaQuery.of(context).size.width * inputBoxWidth,
            height: 28,
            child: Padding(
              padding: const EdgeInsets.only(left: 1, right: 1),
              child: TextFormField(
                controller: productNameController,
                keyboardType: textInputType,
                decoration: InputDecoration(
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 5.0, horizontal: 5),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide:
                        BorderSide(color: ThemeColorDivider, width: 1)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: ThemeColorYellow,
                          width: 1,
                        ))),
                style: TextStyle(fontSize: 12.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}