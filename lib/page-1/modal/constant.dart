import 'package:flutter/material.dart';

import '../../utils.dart';

Color ThemeColorBlue = Color(0xFF2453a9);
Color ThemeColorYellow = Color(0xFFffd203);
Color ThemeColorGrey = Color(0xFF212f32);
Color ThemeColoricon = Color(0xFF818fa4);
Color ThemeColortext = Color(0xFF8f8f8f);
Color ThemeColorDivider = Color(0xFFD9D9D9);
Color ThemeColorGreen = Color(0xFF3DE900);
Color ThemeColorBlueLink = Color(0xFF0500FF);
Color ThemeColorPink = Color(0xFFFA00FF);
Color ThemeColorOrange = Color(0xFFFF8A00);
Color ThemeColorRed = Color(0xFFFF0000);
Color ThemeColorImageText = Color(0xFF0066FF);
Color ThemeColorbothomIcon = Color(0xFF8D99AD);
Color ThemeColorbackground = Color(0xFFE9E9E9);

OutlineInputBorder diableBorder =
    OutlineInputBorder(borderSide: BorderSide(color: ThemeColoricon));
OutlineInputBorder enableborder =
    OutlineInputBorder(borderSide: BorderSide(color: ThemeColorYellow));
TextStyle headingtextStyle = TextStyle(
  color: ThemeColortext,
  fontSize: 14,
);
TextStyle productTextStyle =
    TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold);

class constant extends StatelessWidget {
  const constant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return const Placeholder();
  }
}

TextStyle fontstyle = SafeGoogleFont(
  'Inter',
  fontSize: 12,
  fontWeight: FontWeight.w500,
  height: 2,
  letterSpacing: -0.0900000036,
  color: Color(0xff07090d),
);
