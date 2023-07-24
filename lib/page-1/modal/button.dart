import 'package:flutter/material.dart';

import '../../utils.dart';
class navigateText extends StatelessWidget {
  const navigateText({
    super.key,
    required this.ffem,
    required this.fem, required this.function, required this.text, required this.buttonText,
  });

  final double ffem;
  final double fem;
  final function;
  final String text , buttonText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      textDirection: TextDirection.ltr,
      textBaseline: TextBaseline.alphabetic,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      children: [
        Text(
          text,
          style: SafeGoogleFont(
            'Inter',
            fontSize: 14 * ffem,
            fontWeight: FontWeight.w400,
            height: 1.7142857143 * ffem / fem,
            letterSpacing: -0.0900000036 * fem,
            color: Color(0xff080808),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => function,
              )),
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
          ),
          child:  Container(
            // linkuxS (I41:1928;1016:13021)

            child: Text(
              buttonText,
              textAlign: TextAlign.center,
              style: SafeGoogleFont(
                'Inter',
                fontSize: 14 * ffem,
                fontWeight: FontWeight.w500,
                height: 1.7142857143 * ffem / fem,
                letterSpacing: -0.0900000036 * fem,
                color: Color(0xff1355ff),
              ),
            ),
          ),
        ),
      ],
    );
  }
}