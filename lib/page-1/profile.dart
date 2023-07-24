import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';

import '../utils.dart';


class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 1440;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // profileuc2 (23:763)
        width: double.infinity,
        height: 1024*fem,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Stack(
          children: [
            Positioned(
              // nav1f4 (23:764)
              left: 0*fem,
              top: 0*fem,
              child: Container(
                padding: EdgeInsets.fromLTRB(35*fem, 30*fem, 32*fem, 8*fem),
                width: 1440*fem,
                height: 232*fem,
                decoration: BoxDecoration (
                  image: DecorationImage (
                    fit: BoxFit.contain,
                    image: AssetImage (
                      'assets/page-1/images/nirman-nav-1-bg-BhG.png',
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x3f000000),
                      offset: Offset(0*fem, 4*fem),
                      blurRadius: 5*fem,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      // autogroupasviqe6 (UPueAF45xjFSJRCQEjaSvi)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 69*fem),
                      width: 333*fem,
                      height: 59*fem,
                      child: Stack(
                        children: [
                          Positioned(
                            // group1AAa (23:766)
                            left: 0*fem,
                            top: 0*fem,
                            child: Container(
                              width: 326*fem,
                              height: 59*fem,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    // autogroupwage52e (UPueHA2EWpK6YgeyrtwaGE)
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 13*fem, 0*fem),
                                    width: 185*fem,
                                    height: double.infinity,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          // rectangle7Cd4 (23:767)
                                          left: 62*fem,
                                          top: 4*fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 89*fem,
                                              height: 26*fem,
                                              child: Container(
                                                decoration: BoxDecoration (
                                                  color: Color(0xff2457aa),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          // welcomepriyanshuiLW (23:769)
                                          left: 4*fem,
                                          top: 8.5*fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 148*fem,
                                              height: 24*fem,
                                              child: Text(
                                                'Welcome Priyanshu,',
                                                style: SafeGoogleFont (
                                                  'Poppins',
                                                  fontSize: 14*ffem,
                                                  fontWeight: FontWeight.w700,
                                                  height: 1.7142857143*ffem/fem,
                                                  letterSpacing: -0.0900000036*fem,
                                                  color: Color(0xffffffff),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          // rectangle9PBk (23:770)
                                          left: 0*fem,
                                          top: 0*fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 185*fem,
                                              height: 59*fem,
                                              child: Container(
                                                decoration: BoxDecoration (
                                                  color: Color(0xff2457aa),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    // rectangle8Vka (23:768)
                                    margin: EdgeInsets.fromLTRB(0*fem, 4*fem, 0*fem, 0*fem),
                                    width: 128*fem,
                                    height: 42*fem,
                                    decoration: BoxDecoration (
                                      color: Color(0xff2457aa),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            // capture12kW (23:771)
                            left: 167*fem,
                            top: 21*fem,
                            child: Align(
                              child: SizedBox(
                                width: 166*fem,
                                height: 34*fem,
                                child: Image.asset(
                                  'assets/page-1/images/capture-1-1dY.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // rectangle10jQ2 (23:772)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 559*fem, 0*fem),
                      width: 814*fem,
                      height: 66*fem,
                      decoration: BoxDecoration (
                        color: Color(0xffffffff),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // dashboard4SJ (23:773)
              left: 0*fem,
              top: 152*fem,
              child: Container(
                padding: EdgeInsets.fromLTRB(26*fem, 8*fem, 48*fem, 8*fem),
                width: 1440*fem,
                height: 855*fem,
                decoration: BoxDecoration (
                  color: Color(0xffffffff),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // navigationiconxGn (23:789)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 29*fem, 9*fem),
                      padding: EdgeInsets.fromLTRB(16*fem, 36*fem, 1*fem, 126*fem),
                      decoration: BoxDecoration (
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(24*fem),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xffc4cad4),
                            offset: Offset(0*fem, 2*fem),
                            blurRadius: 4*fem,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // logoCS2 (23:790)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 16*fem, 36*fem),
                            width: 24*fem,
                            height: 24*fem,
                            child: Image.asset(
                              'assets/page-1/images/logo-NiS.png',
                              width: 24*fem,
                              height: 24*fem,
                            ),
                          ),
                          Container(
                            // menusWSi (23:806)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 16*fem, 196*fem),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // iconactiveEdc (23:807)
                                  width: 56*fem,
                                  height: 56*fem,
                                  child: Image.asset(
                                    'assets/page-1/images/icon-active-SAJ.png',
                                    width: 56*fem,
                                    height: 56*fem,
                                  ),
                                ),
                                SizedBox(
                                  height: 8*fem,
                                ),
                                Container(
                                  // iconLwY (23:810)
                                  width: 56*fem,
                                  height: 56*fem,
                                  child: Image.asset(
                                    'assets/page-1/images/icon-hsc.png',
                                    width: 56*fem,
                                    height: 56*fem,
                                  ),
                                ),
                                SizedBox(
                                  height: 8*fem,
                                ),
                                Container(
                                  // iconfiv (23:817)
                                  width: 56*fem,
                                  height: 56*fem,
                                  child: Image.asset(
                                    'assets/page-1/images/icon-MGr.png',
                                    width: 56*fem,
                                    height: 56*fem,
                                  ),
                                ),
                                SizedBox(
                                  height: 8*fem,
                                ),
                                Container(
                                  // iconbsU (23:820)
                                  width: 56*fem,
                                  height: 56*fem,
                                  child: Image.asset(
                                    'assets/page-1/images/icon-zsp.png',
                                    width: 56*fem,
                                    height: 56*fem,
                                  ),
                                ),
                                SizedBox(
                                  height: 8*fem,
                                ),
                                Container(
                                  // iconvuk (24:1280)
                                  width: 56*fem,
                                  height: 56*fem,
                                  child: Image.asset(
                                    'assets/page-1/images/icon-f6e.png',
                                    width: 56*fem,
                                    height: 56*fem,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // iconsKC (23:827)
                            margin: EdgeInsets.fromLTRB(40*fem, 0*fem, 0*fem, 40*fem),
                            width: 40*fem,
                            height: 40*fem,
                            child: Image.asset(
                              'assets/page-1/images/icon-DJv.png',
                              width: 40*fem,
                              height: 40*fem,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // autogroupcpjzbFC (UPueroiqACrtFUYnpicpJz)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 32*fem),
                      width: 1240*fem,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // autogroupf18aiai (UPufCsyiYo8QEyMvJrF18a)
                            width: double.infinity,
                            height: 48*fem,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  // headingfF4 (23:781)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 52*fem, 8*fem),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // profileb8i (23:782)
                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 821*fem, 0*fem),
                                        child: Text(
                                          'Profile',
                                          style: SafeGoogleFont (
                                            'Poppins',
                                            fontSize: 32*ffem,
                                            fontWeight: FontWeight.w500,
                                            height: 1.25*ffem/fem,
                                            letterSpacing: -0.64*fem,
                                            color: Color(0xff22272f),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  // profilet7p (23:774)
                                  height: double.infinity,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // headingRtS (23:775)
                                        margin: EdgeInsets.fromLTRB(0*fem, 2*fem, 28*fem, 2*fem),
                                        height: double.infinity,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              // priyanshugargNHt (23:776)
                                              'Priyanshu Garg',
                                              style: SafeGoogleFont (
                                                'Poppins',
                                                fontSize: 16*ffem,
                                                fontWeight: FontWeight.w700,
                                                height: 1.5*ffem/fem,
                                                color: Color(0xff22272f),
                                              ),
                                            ),
                                            Text(
                                              // priyanshugarggmailcomuYi (23:777)
                                              'priyanshugarg@gmail.com',
                                              style: SafeGoogleFont (
                                                'Poppins',
                                                fontSize: 14*ffem,
                                                fontWeight: FontWeight.w500,
                                                height: 1.4285714286*ffem/fem,
                                                color: Color(0xff7c8ba0),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        // avatarSYe (23:779)
                                        width: 48*fem,
                                        height: double.infinity,
                                        decoration: BoxDecoration (
                                          border: Border.all(color: Color(0xffffd200)),
                                          color: Color(0xffffd200),
                                          borderRadius: BorderRadius.circular(99*fem),
                                        ),
                                        child: Center(
                                          // cutinamomentui0bkkrfusunsplash (23:780)
                                          child: SizedBox(
                                            width: 134*fem,
                                            height: 178*fem,
                                            child: Image.asset(
                                              'assets/page-1/images/cut-in-a-moment-ui0bkkr-fus-unsplashadobeexpress-1-SwY.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // autogrouph8vlght (UPuiF3RBjLKC89dTpeh8VL)
                            padding: EdgeInsets.fromLTRB(34*fem, 58*fem, 34*fem, 0*fem),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // autogroup9en2CRL (UPufUNXuL9ZNbmBc249En2)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 11*fem, 51*fem),
                                  height: 77*fem,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Opacity(
                                        // mobilenumberv6S (23:868)
                                        opacity: 0.99,
                                        child: Container(
                                          width: 345*fem,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                // labelF8i (23:869)
                                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 4*fem),
                                                width: 75*fem,
                                                height: 24*fem,
                                                child: Center(
                                                  child: Text(
                                                    'Full Name',
                                                    style: SafeGoogleFont (
                                                      'Inter',
                                                      fontSize: 16*ffem,
                                                      fontWeight: FontWeight.w500,
                                                      height: 1.5*ffem/fem,
                                                      letterSpacing: -0.0900000036*fem,
                                                      color: Color(0xff07090d),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                // containerinput8CW (23:870)
                                                padding: EdgeInsets.fromLTRB(12*fem, 12*fem, 12*fem, 12*fem),
                                                width: double.infinity,
                                                height: 48*fem,
                                                decoration: BoxDecoration (
                                                  border: Border.all(color: Color(0xff919191)),
                                                  color: Color(0xffffffff),
                                                  borderRadius: BorderRadius.circular(6*fem),
                                                ),
                                                child: Text(
                                                  'Enter Seller Name',
                                                  style: SafeGoogleFont (
                                                    'Inter',
                                                    fontSize: 16*ffem,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.5*ffem/fem,
                                                    letterSpacing: -0.0900000036*fem,
                                                    color: Color(0xff919191),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 50*fem,
                                      ),
                                      Container(
                                        // idproofN6r (23:831)
                                        width: 154*fem,
                                        height: double.infinity,
                                        decoration: BoxDecoration (
                                          borderRadius: BorderRadius.circular(8*fem),
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              // dateofbirthhQ2 (23:832)
                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 5*fem),
                                              child: Text(
                                                'Date of Birth',
                                                style: SafeGoogleFont (
                                                  'Inter',
                                                  fontSize: 16*ffem,
                                                  fontWeight: FontWeight.w500,
                                                  height: 1.5*ffem/fem,
                                                  letterSpacing: -0.48*fem,
                                                  color: Color(0xff160042),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              // dropdownmenuc1C (23:833)
                                              width: double.infinity,
                                              height: 48*fem,
                                              decoration: BoxDecoration (
                                                border: Border.all(color: Color(0xff8f8f8f)),
                                                color: Color(0xffffffff),
                                                borderRadius: BorderRadius.circular(8*fem),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'DD/MM/YYYY',
                                                  style: SafeGoogleFont (
                                                    'Inter',
                                                    fontSize: 16*ffem,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.5*ffem/fem,
                                                    letterSpacing: -0.16*fem,
                                                    color: Color(0xff8f8f8f),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 50*fem,
                                      ),
                                      Container(
                                        // idproofU3Q (23:855)
                                        width: 308*fem,
                                        height: double.infinity,
                                        decoration: BoxDecoration (
                                          borderRadius: BorderRadius.circular(8*fem),
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              // emailidcQW (23:856)
                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 5*fem),
                                              child: Text(
                                                'Email ID',
                                                style: SafeGoogleFont (
                                                  'Inter',
                                                  fontSize: 16*ffem,
                                                  fontWeight: FontWeight.w500,
                                                  height: 1.5*ffem/fem,
                                                  letterSpacing: -0.48*fem,
                                                  color: Color(0xff160042),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              // dropdownmenuKJv (23:857)
                                              padding: EdgeInsets.fromLTRB(16*fem, 12*fem, 16*fem, 12*fem),
                                              width: double.infinity,
                                              decoration: BoxDecoration (
                                                border: Border.all(color: Color(0xff8f8f8f)),
                                                color: Color(0xffffffff),
                                                borderRadius: BorderRadius.circular(8*fem),
                                              ),
                                              child: Text(
                                                'something@email.com',
                                                style: SafeGoogleFont (
                                                  'Inter',
                                                  fontSize: 16*ffem,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.5*ffem/fem,
                                                  letterSpacing: -0.16*fem,
                                                  color: Color(0xff8f8f8f),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 50*fem,
                                      ),
                                      Opacity(
                                        // mobilenumbermwc (23:906)
                                        opacity: 0.99,
                                        child: Container(
                                          width: 204*fem,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                // labelWPQ (23:907)
                                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 4*fem),
                                                width: 113*fem,
                                                height: 24*fem,
                                                child: Center(
                                                  child: Text(
                                                    'Phone Number',
                                                    style: SafeGoogleFont (
                                                      'Inter',
                                                      fontSize: 16*ffem,
                                                      fontWeight: FontWeight.w500,
                                                      height: 1.5*ffem/fem,
                                                      letterSpacing: -0.0900000036*fem,
                                                      color: Color(0xff07090d),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                // containerinputynn (23:908)
                                                padding: EdgeInsets.fromLTRB(12*fem, 12*fem, 12*fem, 12*fem),
                                                width: double.infinity,
                                                height: 48*fem,
                                                decoration: BoxDecoration (
                                                  border: Border.all(color: Color(0xff919191)),
                                                  color: Color(0xffffffff),
                                                  borderRadius: BorderRadius.circular(6*fem),
                                                ),
                                                child: Text(
                                                  '+91-XXXXXXXXXX',
                                                  style: SafeGoogleFont (
                                                    'Inter',
                                                    fontSize: 16*ffem,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.5*ffem/fem,
                                                    letterSpacing: -0.0900000036*fem,
                                                    color: Color(0xff919191),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  // autogroupnt2wEyc (UPug6wKJube451ALHvNT2W)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 88*fem, 51*fem),
                                  height: 76*fem,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // iddocumentmTk (23:911)
                                        width: 328*fem,
                                        height: double.infinity,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              // labeliNz (23:912)
                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 4*fem),
                                              width: 125*fem,
                                              height: 24*fem,
                                              child: Center(
                                                child: Text(
                                                  'Seller Document',
                                                  style: SafeGoogleFont (
                                                    'Inter',
                                                    fontSize: 16*ffem,
                                                    fontWeight: FontWeight.w500,
                                                    height: 1.5*ffem/fem,
                                                    letterSpacing: -0.0900000036*fem,
                                                    color: Color(0xff000000),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              // containerinputnte (23:913)
                                              padding: EdgeInsets.fromLTRB(12*fem, 4*fem, 2.12*fem, 5*fem),
                                              width: double.infinity,
                                              height: 48*fem,
                                              decoration: BoxDecoration (
                                                border: Border.all(color: Color(0xff8f8f8f)),
                                                color: Color(0xffffffff),
                                                borderRadius: BorderRadius.circular(6*fem),
                                              ),
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    // user574 (23:914)
                                                    margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 8*fem, 0*fem),
                                                    width: 24*fem,
                                                    height: 24*fem,
                                                    child: Image.asset(
                                                      'assets/page-1/images/user-x2i.png',
                                                      width: 24*fem,
                                                      height: 24*fem,
                                                    ),
                                                  ),
                                                  Container(
                                                    // autogroupce6znGN (UPugSbRDstqA6SFLALCe6z)
                                                    margin: EdgeInsets.fromLTRB(0*fem, 8*fem, 26*fem, 7*fem),
                                                    width: 181*fem,
                                                    height: double.infinity,
                                                    child: Center(
                                                      child: Text(
                                                        'Upload Seller Document',
                                                        style: SafeGoogleFont (
                                                          'Inter',
                                                          fontSize: 16*ffem,
                                                          fontWeight: FontWeight.w400,
                                                          height: 1.5*ffem/fem,
                                                          letterSpacing: -0.0900000036*fem,
                                                          color: Color(0xff8f8f8f),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    // verifybuttonFve (23:921)
                                                    width: 74.88*fem,
                                                    height: double.infinity,
                                                    decoration: BoxDecoration (
                                                      borderRadius: BorderRadius.circular(3*fem),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Color(0x21000000),
                                                          offset: Offset(0*fem, 0*fem),
                                                          blurRadius: 2*fem,
                                                        ),
                                                      ],
                                                    ),
                                                    child: Container(
                                                      // registerbuttonn9t (23:922)
                                                      width: double.infinity,
                                                      height: double.infinity,
                                                      decoration: BoxDecoration (
                                                        color: Color(0xffffd200),
                                                        borderRadius: BorderRadius.circular(3*fem),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          'CHOOSE',
                                                          style: SafeGoogleFont (
                                                            'Inter',
                                                            fontSize: 14*ffem,
                                                            fontWeight: FontWeight.w700,
                                                            height: 1.7142857143*ffem/fem,
                                                            letterSpacing: -0.0900000036*fem,
                                                            color: Color(0xff000000),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 50*fem,
                                      ),
                                      Container(
                                        // iddocumentdwC (24:462)
                                        width: 328*fem,
                                        height: double.infinity,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              // labelzWr (24:463)
                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 4*fem),
                                              width: 131*fem,
                                              height: 24*fem,
                                              child: Center(
                                                child: Text(
                                                  'Personal ID Proof',
                                                  style: SafeGoogleFont (
                                                    'Inter',
                                                    fontSize: 16*ffem,
                                                    fontWeight: FontWeight.w500,
                                                    height: 1.5*ffem/fem,
                                                    letterSpacing: -0.0900000036*fem,
                                                    color: Color(0xff000000),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              // containerinputtML (24:464)
                                              padding: EdgeInsets.fromLTRB(12*fem, 4*fem, 2.12*fem, 5*fem),
                                              width: double.infinity,
                                              height: 48*fem,
                                              decoration: BoxDecoration (
                                                border: Border.all(color: Color(0xff8f8f8f)),
                                                color: Color(0xffffffff),
                                                borderRadius: BorderRadius.circular(6*fem),
                                              ),
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    // userBbL (24:465)
                                                    margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 8*fem, 0*fem),
                                                    width: 24*fem,
                                                    height: 24*fem,
                                                    child: Image.asset(
                                                      'assets/page-1/images/user-5T4.png',
                                                      width: 24*fem,
                                                      height: 24*fem,
                                                    ),
                                                  ),
                                                  Container(
                                                    // autogroup2qeau1Y (UPugq5mkVnwUHuURRF2QEa)
                                                    margin: EdgeInsets.fromLTRB(0*fem, 8*fem, 51*fem, 7*fem),
                                                    width: 156*fem,
                                                    height: double.infinity,
                                                    child: Center(
                                                      child: Text(
                                                        'Upload your ID Proof',
                                                        style: SafeGoogleFont (
                                                          'Inter',
                                                          fontSize: 16*ffem,
                                                          fontWeight: FontWeight.w400,
                                                          height: 1.5*ffem/fem,
                                                          letterSpacing: -0.0900000036*fem,
                                                          color: Color(0xff8f8f8f),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    // verifybuttonBjk (24:472)
                                                    width: 74.88*fem,
                                                    height: double.infinity,
                                                    decoration: BoxDecoration (
                                                      borderRadius: BorderRadius.circular(3*fem),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Color(0x21000000),
                                                          offset: Offset(0*fem, 0*fem),
                                                          blurRadius: 2*fem,
                                                        ),
                                                      ],
                                                    ),
                                                    child: Container(
                                                      // registerbutton7NW (24:473)
                                                      width: double.infinity,
                                                      height: double.infinity,
                                                      decoration: BoxDecoration (
                                                        color: Color(0xffffd200),
                                                        borderRadius: BorderRadius.circular(3*fem),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          'CHOOSE',
                                                          style: SafeGoogleFont (
                                                            'Inter',
                                                            fontSize: 14*ffem,
                                                            fontWeight: FontWeight.w700,
                                                            height: 1.7142857143*ffem/fem,
                                                            letterSpacing: -0.0900000036*fem,
                                                            color: Color(0xff000000),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 50*fem,
                                      ),
                                      Container(
                                        // iddocumentnUe (24:479)
                                        width: 328*fem,
                                        height: double.infinity,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              // labelXx2 (24:480)
                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 4*fem),
                                              width: 108*fem,
                                              height: 24*fem,
                                              child: Center(
                                                child: Text(
                                                  'Address Proof',
                                                  style: SafeGoogleFont (
                                                    'Inter',
                                                    fontSize: 16*ffem,
                                                    fontWeight: FontWeight.w500,
                                                    height: 1.5*ffem/fem,
                                                    letterSpacing: -0.0900000036*fem,
                                                    color: Color(0xff000000),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              // containerinputpAS (24:481)
                                              padding: EdgeInsets.fromLTRB(12*fem, 4*fem, 2.12*fem, 5*fem),
                                              width: double.infinity,
                                              height: 48*fem,
                                              decoration: BoxDecoration (
                                                border: Border.all(color: Color(0xff8f8f8f)),
                                                color: Color(0xffffffff),
                                                borderRadius: BorderRadius.circular(6*fem),
                                              ),
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    // userX4r (24:482)
                                                    margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 8*fem, 0*fem),
                                                    width: 24*fem,
                                                    height: 24*fem,
                                                    child: Image.asset(
                                                      'assets/page-1/images/user-qug.png',
                                                      width: 24*fem,
                                                      height: 24*fem,
                                                    ),
                                                  ),
                                                  Container(
                                                    // autogroupbpsceQN (UPuhAVP5ciHXY6iwX2BPsC)
                                                    margin: EdgeInsets.fromLTRB(0*fem, 8*fem, 42*fem, 7*fem),
                                                    width: 165*fem,
                                                    height: double.infinity,
                                                    child: Center(
                                                      child: Text(
                                                        'Upload Address Proof',
                                                        style: SafeGoogleFont (
                                                          'Inter',
                                                          fontSize: 16*ffem,
                                                          fontWeight: FontWeight.w400,
                                                          height: 1.5*ffem/fem,
                                                          letterSpacing: -0.0900000036*fem,
                                                          color: Color(0xff8f8f8f),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    // verifybuttonL2J (24:489)
                                                    width: 74.88*fem,
                                                    height: double.infinity,
                                                    decoration: BoxDecoration (
                                                      borderRadius: BorderRadius.circular(3*fem),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Color(0x21000000),
                                                          offset: Offset(0*fem, 0*fem),
                                                          blurRadius: 2*fem,
                                                        ),
                                                      ],
                                                    ),
                                                    child: Container(
                                                      // registerbuttonGAr (24:490)
                                                      width: double.infinity,
                                                      height: double.infinity,
                                                      decoration: BoxDecoration (
                                                        color: Color(0xffffd200),
                                                        borderRadius: BorderRadius.circular(3*fem),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          'CHOOSE',
                                                          style: SafeGoogleFont (
                                                            'Inter',
                                                            fontSize: 14*ffem,
                                                            fontWeight: FontWeight.w700,
                                                            height: 1.7142857143*ffem/fem,
                                                            letterSpacing: -0.0900000036*fem,
                                                            color: Color(0xff000000),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  // iddocumentwnn (24:496)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 844*fem, 41*fem),
                                  width: 328*fem,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        // labelUGv (24:497)
                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 4*fem),
                                        width: 103*fem,
                                        height: 24*fem,
                                        child: Center(
                                          child: Text(
                                            'Upload Photo',
                                            style: SafeGoogleFont (
                                              'Inter',
                                              fontSize: 16*ffem,
                                              fontWeight: FontWeight.w500,
                                              height: 1.5*ffem/fem,
                                              letterSpacing: -0.0900000036*fem,
                                              color: Color(0xff000000),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        // containerinputkkE (24:498)
                                        padding: EdgeInsets.fromLTRB(12*fem, 4*fem, 2.12*fem, 5*fem),
                                        width: double.infinity,
                                        height: 48*fem,
                                        decoration: BoxDecoration (
                                          border: Border.all(color: Color(0xff8f8f8f)),
                                          color: Color(0xffffffff),
                                          borderRadius: BorderRadius.circular(6*fem),
                                        ),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              // userFwt (24:499)
                                              margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 8*fem, 0*fem),
                                              width: 24*fem,
                                              height: 24*fem,
                                              child: Image.asset(
                                                'assets/page-1/images/user-zJ2.png',
                                                width: 24*fem,
                                                height: 24*fem,
                                              ),
                                            ),
                                            Container(
                                              // autogroupmexnP2W (UPukdiw7DNeo1YXBubmexn)
                                              margin: EdgeInsets.fromLTRB(0*fem, 8*fem, 68*fem, 7*fem),
                                              width: 139*fem,
                                              height: double.infinity,
                                              child: Center(
                                                child: Text(
                                                  'Upload your photo',
                                                  style: SafeGoogleFont (
                                                    'Inter',
                                                    fontSize: 16*ffem,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.5*ffem/fem,
                                                    letterSpacing: -0.0900000036*fem,
                                                    color: Color(0xff8f8f8f),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              // verifybuttonsCa (24:506)
                                              width: 74.88*fem,
                                              height: double.infinity,
                                              decoration: BoxDecoration (
                                                borderRadius: BorderRadius.circular(3*fem),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color(0x21000000),
                                                    offset: Offset(0*fem, 0*fem),
                                                    blurRadius: 2*fem,
                                                  ),
                                                ],
                                              ),
                                              child: Container(
                                                // registerbuttonCEr (24:507)
                                                width: double.infinity,
                                                height: double.infinity,
                                                decoration: BoxDecoration (
                                                  color: Color(0xffffd200),
                                                  borderRadius: BorderRadius.circular(3*fem),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    'CHOOSE',
                                                    style: SafeGoogleFont (
                                                      'Inter',
                                                      fontSize: 14*ffem,
                                                      fontWeight: FontWeight.w700,
                                                      height: 1.7142857143*ffem/fem,
                                                      letterSpacing: -0.0900000036*fem,
                                                      color: Color(0xff000000),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  // autogroupiwb8fu8 (UPuhK4y7qyeqed63c4iWB8)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 20*fem, 51*fem),
                                  width: double.infinity,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        // group25QLv (24:513)
                                        margin: EdgeInsets.fromLTRB(0*fem, 10*fem, 50*fem, 0*fem),
                                        width: 898*fem,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              // labelje6 (23:874)
                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 4*fem),
                                              width: 133*fem,
                                              height: 24*fem,
                                              child: Center(
                                                child: Text(
                                                  'Personal Address',
                                                  style: SafeGoogleFont (
                                                    'Inter',
                                                    fontSize: 16*ffem,
                                                    fontWeight: FontWeight.w500,
                                                    height: 1.5*ffem/fem,
                                                    letterSpacing: -0.0900000036*fem,
                                                    color: Color(0xff07090d),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              // containerinputpQe (23:875)
                                              padding: EdgeInsets.fromLTRB(12*fem, 12*fem, 12*fem, 18*fem),
                                              width: double.infinity,
                                              height: 54*fem,
                                              decoration: BoxDecoration (
                                                border: Border.all(color: Color(0xff919191)),
                                                color: Color(0xffffffff),
                                                borderRadius: BorderRadius.circular(6*fem),
                                              ),
                                              child: RichText(
                                                text: TextSpan(
                                                  style: SafeGoogleFont (
                                                    'Inter',
                                                    fontSize: 16*ffem,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.5*ffem/fem,
                                                    letterSpacing: -0.0900000036*fem,
                                                    color: Color(0xff919191),
                                                  ),
                                                  children: [
                                                    TextSpan(
                                                      text: 'Enter ',
                                                    ),
                                                    TextSpan(
                                                      text: 'Personal Address',
                                                      style: SafeGoogleFont (
                                                        'Inter',
                                                        fontSize: 16*ffem,
                                                        fontWeight: FontWeight.w400,
                                                        height: 1.5*ffem/fem,
                                                        letterSpacing: -0.0900000036*fem,
                                                        color: Color(0xff919191),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Opacity(
                                        // mobilenumberQXG (24:514)
                                        opacity: 0.99,
                                        child: Container(
                                          width: 204*fem,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                // labelLfp (24:515)
                                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 4*fem),
                                                width: 75*fem,
                                                height: 24*fem,
                                                child: Text(
                                                  'Pin Code',
                                                  style: SafeGoogleFont (
                                                    'Inter',
                                                    fontSize: 16*ffem,
                                                    fontWeight: FontWeight.w500,
                                                    height: 1.5*ffem/fem,
                                                    letterSpacing: -0.0900000036*fem,
                                                    color: Color(0xff07090d),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                // containerinputq6n (24:516)
                                                padding: EdgeInsets.fromLTRB(12*fem, 12*fem, 12*fem, 12*fem),
                                                width: double.infinity,
                                                height: 48*fem,
                                                decoration: BoxDecoration (
                                                  border: Border.all(color: Color(0xff919191)),
                                                  color: Color(0xffffffff),
                                                  borderRadius: BorderRadius.circular(6*fem),
                                                ),
                                                child: Text(
                                                  'XXX XXX',
                                                  style: SafeGoogleFont (
                                                    'Inter',
                                                    fontSize: 16*ffem,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.5*ffem/fem,
                                                    letterSpacing: -0.0900000036*fem,
                                                    color: Color(0xff919191),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  // autogroup6ewsJFG (UPuhkUQTPwJ3cYQ4B26EWS)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 20*fem, 39*fem),
                                  width: double.infinity,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        // group26Qp6 (24:522)
                                        margin: EdgeInsets.fromLTRB(0*fem, 10*fem, 50*fem, 0*fem),
                                        width: 898*fem,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              // labelvnS (24:523)
                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 4*fem),
                                              width: 107*fem,
                                              height: 24*fem,
                                              child: Center(
                                                child: Text(
                                                  'Shop Address',
                                                  style: SafeGoogleFont (
                                                    'Inter',
                                                    fontSize: 16*ffem,
                                                    fontWeight: FontWeight.w500,
                                                    height: 1.5*ffem/fem,
                                                    letterSpacing: -0.0900000036*fem,
                                                    color: Color(0xff07090d),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              // containerinput1Yz (24:524)
                                              padding: EdgeInsets.fromLTRB(12*fem, 12*fem, 12*fem, 18*fem),
                                              width: double.infinity,
                                              height: 54*fem,
                                              decoration: BoxDecoration (
                                                border: Border.all(color: Color(0xff919191)),
                                                color: Color(0xffffffff),
                                                borderRadius: BorderRadius.circular(6*fem),
                                              ),
                                              child: RichText(
                                                text: TextSpan(
                                                  style: SafeGoogleFont (
                                                    'Inter',
                                                    fontSize: 16*ffem,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.5*ffem/fem,
                                                    letterSpacing: -0.0900000036*fem,
                                                    color: Color(0xff919191),
                                                  ),
                                                  children: [
                                                    TextSpan(
                                                      text: 'Enter Shop',
                                                    ),
                                                    TextSpan(
                                                      text: ' Address',
                                                      style: SafeGoogleFont (
                                                        'Inter',
                                                        fontSize: 16*ffem,
                                                        fontWeight: FontWeight.w400,
                                                        height: 1.5*ffem/fem,
                                                        letterSpacing: -0.0900000036*fem,
                                                        color: Color(0xff919191),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Opacity(
                                        // mobilenumberYhL (24:527)
                                        opacity: 0.99,
                                        child: Container(
                                          width: 204*fem,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                // label5hG (24:528)
                                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 4*fem),
                                                width: 75*fem,
                                                height: 24*fem,
                                                child: Text(
                                                  'Pin Code',
                                                  style: SafeGoogleFont (
                                                    'Inter',
                                                    fontSize: 16*ffem,
                                                    fontWeight: FontWeight.w500,
                                                    height: 1.5*ffem/fem,
                                                    letterSpacing: -0.0900000036*fem,
                                                    color: Color(0xff07090d),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                // containerinputBEW (24:529)
                                                padding: EdgeInsets.fromLTRB(12*fem, 12*fem, 12*fem, 12*fem),
                                                width: double.infinity,
                                                height: 48*fem,
                                                decoration: BoxDecoration (
                                                  border: Border.all(color: Color(0xff919191)),
                                                  color: Color(0xffffffff),
                                                  borderRadius: BorderRadius.circular(6*fem),
                                                ),
                                                child: Text(
                                                  'XXX XXX',
                                                  style: SafeGoogleFont (
                                                    'Inter',
                                                    fontSize: 16*ffem,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.5*ffem/fem,
                                                    letterSpacing: -0.0900000036*fem,
                                                    color: Color(0xff919191),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  // verifybutton43Q (23:938)
                                  margin: EdgeInsets.fromLTRB(1057*fem, 0*fem, 0*fem, 0*fem),
                                  width: 115*fem,
                                  height: 39*fem,
                                  decoration: BoxDecoration (
                                    borderRadius: BorderRadius.circular(3*fem),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x21000000),
                                        offset: Offset(0*fem, 0*fem),
                                        blurRadius: 2*fem,
                                      ),
                                    ],
                                  ),
                                  child: Container(
                                    // registerbutton9ae (23:939)
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration (
                                      color: Color(0xffffd200),
                                      borderRadius: BorderRadius.circular(3*fem),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'SAVE',
                                        style: SafeGoogleFont (
                                          'Inter',
                                          fontSize: 14*ffem,
                                          fontWeight: FontWeight.w700,
                                          height: 1.7142857143*ffem/fem,
                                          letterSpacing: -0.0900000036*fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
          );
  }
}