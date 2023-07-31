import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'dart:ui';
import 'package:http/http.dart'as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:nirmal_store/page-1/modal/SimpleInputBox.dart';
import 'package:nirmal_store/screens/HomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
Map SendOTPData = Map();
Map LoginData = Map();


class _LoginState extends State<Login> {
  TextEditingController mobileController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  var setheight3= 35.00;

  var padding1 = EdgeInsetsDirectional.symmetric(horizontal: 0,vertical: 0);

  var setheight4= 35.00;
  void _setKey(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', key);
    print('set key');
  }

  Future SendOTP(type,mobile_no)async{
    try{
      var headers = {
        'Cookie': 'ci_session=23fdf7723748242a247650083cd62dee4f8af07d'
      };
      var request = http.MultipartRequest('POST', Uri.parse('https://thenirmanstore.com/v1/seller/send_otp'));
      request.fields.addAll({
        'type': type,
        'mobile_no': mobile_no
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var data = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        SendOTPData = jsonDecode(data);
        setState(() {
          otpController.text = SendOTPData['data']['otp'];
        });
        print(SendOTPData);

      }
      else {
        print(response.reasonPhrase);
      }

    }catch(e){

    }

  }
  Future LoginApi (
      mobile_no,otp
      )async{
    var headers = {
      'Cookie': 'ci_session=73d9e6e14320eeccd65fd5e134696e98cb5d0e71'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://thenirmanstore.com/v1/seller/login'));
    request.fields.addAll({
      'mobile_no': mobile_no,
      'otp': otp
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var data = await response.stream.bytesToString();
    LoginData = jsonDecode(data);

    if (response.statusCode == 200) {
      if(LoginData['status']==1){
        _setKey(LoginData['data']['token']);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
      }
    }
    else {
      print(response.reasonPhrase);
    }


  }
  @override
  var account;
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    late FocusNode mobileNumberFocusNode = FocusNode()
      ..addListener(() {
        setState(() {});
      });
    late FocusNode otpMobileFocusNode = FocusNode()
      ..addListener(() {
        setState(() {});
      });
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    late FocusNode focusNode = FocusNode()
      ..addListener(() {
        setState(() {});
      });

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
                child: Form(
                  key: _formkey,
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

                              Opacity(
                                opacity: 0.99,
                                child: Container(
                                  margin: EdgeInsets.only(
                                    bottom: 15,
                                    top: 8,
                                  ),
                                  height: setheight3,
                                  child: TextFormField(
                                    controller: mobileController,
                                    keyboardType: TextInputType.number,
                                   focusNode: mobileNumberFocusNode,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        setState(() {
                                          setheight3 = 55;
                                          padding1 =
                                              EdgeInsetsDirectional.only(top: 8.0, bottom: 8);
                                        });
                                        return "Please enter your mobile number";
                                      } else if (value!.contains(',')) {
                                        setheight3 = 55;
                                        padding1 =
                                            EdgeInsetsDirectional.only(top: 8.0, bottom: 8);
                                        return "Invalid input. Please enter numbers only";
                                      }
                                      if (value.contains('.')) {
                                        setheight3 = 55;
                                        padding1 =
                                            EdgeInsetsDirectional.only(top: 8.0, bottom: 8);
                                        return "Invalid input. Please enter numbers only";
                                      }
                                      if (value.contains('-')) {
                                        setheight3 = 55;
                                        padding1 =
                                            EdgeInsetsDirectional.only(top: 8.0, bottom: 8);
                                        return "Invalid input. Please enter numbers only";
                                      }
                                      if (value.contains(' ')) {
                                        setheight3 = 55;
                                        padding1 =
                                            EdgeInsetsDirectional.only(top: 8.0, bottom: 8);
                                        return "Invalid input. Please enter numbers only without any spaces";
                                      }

                                      if (value.length < 10) {
                                        setheight3 = 55;
                                        padding1 =
                                            EdgeInsetsDirectional.only(top: 8.0, bottom: 8);
                                        return "Please enter full 10 digit number";
                                      } else {
                                        setState(() {
                                          setheight3 = 35;
                                          padding1 =
                                              EdgeInsetsDirectional.only(top: 0.0, bottom: 0);
                                        });
                                      }
                                      // Add validation for mobile number format if needed
                                      return null;
                                    },
                                    inputFormatters: [LengthLimitingTextInputFormatter(10)],
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.phone_outlined,
                                          // color: mobileNumberFocusNode.hasFocus
                                          //     ? ThemeColorYellow
                                          //     : ThemeColortext,
                                        ),
                                        suffixIcon: Container(
                                       //   padding: padding1,
                                          height: 1,
                                          margin: EdgeInsets.all(1),
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: ThemeColorYellow,
                                            ),
                                            onPressed: () {
                                              SendOTP("1",
                                                  mobileController.text.toString());
                                            },
                                            child: Text(
                                              "Get OTP",
                                              style: TextStyle(
                                                  color: Colors.black, fontSize: 10),
                                            ),
                                          ),
                                        ),
                                        hintText: "Mobile Number",
                                        hintStyle: TextStyle(
                                          fontSize: 12,
                                        ),
                                        prefix: SizedBox(
                                          height: 20,
                                        ),
                                        border: diableBorder,
                                        focusedBorder: enableborder),
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
                      Opacity(
                        opacity: 0.99,
                        child: Container(
                          margin: EdgeInsets.only(
                            bottom: 15,
                            top: 8,
                          ),
                          height: setheight4,
                          child: TextFormField(
                            controller: otpController,
                            keyboardType: TextInputType.number,
                            focusNode: otpMobileFocusNode,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                setState(() {
                                  setheight4 = 55;
                                });
                                return "Please enter the OTP";
                              } else {
                                setState(() {
                                  setheight4 = 35;
                                });
                              }
                              // Add validation for OTP format if needed
                              return null;
                            },
                            decoration: InputDecoration(
                                hintText: "OTP from Mobile",
                                hintStyle: TextStyle(
                                  fontSize: 12,
                                ),
                                prefix: SizedBox(
                                  height: 20,
                                ),
                                border: diableBorder,
                                focusedBorder: enableborder),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          width: MediaQuery.of(context).size.width * 0.30,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ThemeColorYellow,
                                minimumSize: Size.fromHeight(32),
                              ),
                              onPressed: () {
    if (_formkey.currentState!.validate()) {
      LoginApi(mobileController.text.toString(), otpController.text.toString());
    }




                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              )),
                        ),
                      ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
