import 'package:flutter/material.dart';

import 'constant.dart';

class dropdownbutton extends StatelessWidget {
  const dropdownbutton({
    super.key,  required this.text, required this.function,
  });
  final  function;

  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.28,
      child: ElevatedButton(


          style: ElevatedButton.styleFrom(

              backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent
          ),
          onPressed: () {
            Navigator.push(context,MaterialPageRoute(builder: (context) => function,));

          },
          child: Text(text,
            style: TextStyle(
              color: ThemeColorBlue,
            ),)),
    );
  }
}