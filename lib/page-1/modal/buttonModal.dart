import 'package:flutter/material.dart';

import 'constant.dart';
class ButtonModal extends StatelessWidget {
   ButtonModal({
    super.key, required this.buttonText,this.function
  });
  final String buttonText;
  var function;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.30,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: ThemeColorYellow,
              minimumSize: Size.fromHeight(32),
            ),
            onPressed: () {
             // Navigator.push(context, MaterialPageRoute(builder: (context) => function,));
            },
            child: Text(
              buttonText,
              style: TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            )),
      ),
    );
  }
}