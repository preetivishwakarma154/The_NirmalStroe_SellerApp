import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';


import '../page-1/modal/InputBox.dart';
import '../page-1/modal/button.dart';
import '../page-1/modal/buttonModal.dart';
import '../page-1/modal/constant.dart';
import '../page-1/modal/constant.dart';
import '../page-1/modal/constant.dart';
import '../page-1/modal/constant.dart';
import '../page-1/modal/dropdownbutton.dart';
import '../utils.dart';
import 'Registration.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController mobileController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  @override
  var account;
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      appBar: AppBar(
        title: Text("The Nirmal Store"),
        automaticallyImplyLeading: false,
        actions: [
          Container(
            padding: EdgeInsets.only(right: 15),
            height: MediaQuery.of(context).size.height / 25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Icon(Icons.person),
                    Text(
                      "Sign In",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: 5),
                  alignment: Alignment.bottomRight,
                  width: MediaQuery.of(context).size.width * 0.28,
                  child: DropdownButtonFormField<int>(
                      isExpanded: true,
                      decoration: InputDecoration(
                        labelText: "Account",
                        isCollapsed: true,
                        border: InputBorder.none,
                        labelStyle:
                            TextStyle(color: ThemeColorYellow, fontSize: 18),
                        filled: true,
                      ),
                      hint: Text(''),
                      icon: Icon(Icons.arrow_drop_down_outlined),
                      iconDisabledColor: ThemeColorYellow,
                      iconEnabledColor: ThemeColorYellow,
                      elevation: 0,
                      onChanged: (value) {
                        account = value!;
                        // This is called when the user selects an item.
                        setState(() {
                          account;
                        });
                      },
                      value: account,
                      style: TextStyle(color: ThemeColorBlue),
                      items: [
                        DropdownMenuItem(
                          value: 1,
                          child: dropdownbutton(
                            function: Login(),
                            text: "Login",
                          ),
                        ),
                        DropdownMenuItem(
                          value: 2,
                          child: dropdownbutton(
                            function: Registration(),
                            text: "Registration",
                          ),
                        )
                      ]),
                )
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          // iphone148W8N (41:1908)
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // autogroupltevNgN (UPwxQ8sqHjyuYNArosLTev)
                padding: EdgeInsets.fromLTRB(
                    49 * fem, 23 * fem, 49 * fem, 179 * fem),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // loginJK8 (41:1931)
                      margin: EdgeInsets.fromLTRB(
                          1 * fem, 60 * fem, 0 * fem, 0 * fem),
                      child: Text(
                        'LOG IN',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont(
                          'Poppins',
                          fontSize: 16 * ffem,
                          fontWeight: FontWeight.w700,
                          height: 2.5 * ffem / fem,
                          letterSpacing: -0.24 * fem,
                          color: Color(0xff07090d),
                        ),
                      ),
                    ),
                    Image(
                      image: AssetImage("assets/page-1/images/logo.png"),
                      height: MediaQuery.of(context).size.height * 0.14,
                    ),
                    Opacity(
                      // mobilenumbernVC (41:1915)
                      opacity: 0.99,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(
                            1 * fem, 20 * fem, 0 * fem, 4 * fem),
                        width: 291 * fem,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // labelV8i (41:1916)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 0 * fem, 6 * fem),

                              child: Center(
                                child: RichText(
                                  text: TextSpan(
                                    style: SafeGoogleFont(
                                      'Inter',
                                      fontSize: 12 * ffem,
                                      fontWeight: FontWeight.w500,
                                      height: 2 * ffem / fem,
                                      letterSpacing: -0.0900000036 * fem,
                                      color: Color(0xff07090d),
                                    ),
                                    children: [
                                      TextSpan(
                                        text: 'Mobile Number ',
                                        style: SafeGoogleFont(
                                          'Inter',
                                          fontSize: 12 * ffem,
                                          fontWeight: FontWeight.w500,
                                          height: 2 * ffem / fem,
                                          letterSpacing: -0.0900000036 * fem,
                                          color: Color(0xff07090d),
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            '(An OTP will be sent to this number)',
                                        style: SafeGoogleFont(
                                          'Inter',
                                          fontSize: 12 * ffem,
                                          fontWeight: FontWeight.w500,
                                          height: 2 * ffem / fem,
                                          letterSpacing: -0.0900000036 * fem,
                                          color: Color(0xff8f8f8f),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 30),
                              height: 35,
                              child: TextFormField(
                                controller: mobileController,
                                decoration: InputDecoration(
                                  hintText: "Mobile Number",

                                  hintStyle: TextStyle(
                                    fontSize: 12,
                                  ),
                                  prefixIcon: Icon(Icons.phone),
                                  prefix: SizedBox(
                                    height: 20,
                                  ),
                                  // errorBorder: OutlineInputBorder(
                                  //     borderRadius: BorderRadius.circular(5),
                                  //     borderSide: BorderSide(
                                  //         color: Colors.red
                                  //     )
                                  // ),

                                  // enabledBorder: OutlineInputBorder(
                                  //   borderRadius: BorderRadius.circular(5),
                                  //   borderSide: BorderSide(
                                  //     color: ThemeColorYellow
                                  //   )
                                  //
                                  //
                                  // ),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          style: BorderStyle.solid,
                                          width: 0.5,
                                          color: Colors.red)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Opacity(
                      // phoneotpnZ4 (41:1910)
                      opacity: 0.99,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 1 * fem, 2 * fem),
                        width: 291 * fem,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // labeltrz (41:1911)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 0 * fem, 4 * fem),
                              width: 168 * fem,
                              height: 24 * fem,
                              child: Center(
                                child: Text(
                                  'Enter OTP received on mobile',
                                  style: SafeGoogleFont(
                                    'Inter',
                                    fontSize: 12 * ffem,
                                    fontWeight: FontWeight.w500,
                                    height: 2 * ffem / fem,
                                    letterSpacing: -0.0900000036 * fem,
                                    color: Color(0xff9b9b9b),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 30,
                      ),
                      child: InputBox(
                        controller: otpController,
                        hintText: 'OTP',
                        textInputType: TextInputType.number,
                      ),
                    ),
                    ButtonModal(buttonText: "LOGIN",),
                    navigateText(
                      ffem: ffem,
                      fem: fem,
                      function: Registration(),
                      text: 'Don’t have an account?',
                      buttonText: 'Register',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


