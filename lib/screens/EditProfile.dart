import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nirmal_store/screens/Registration.dart';
import 'package:http/http.dart'as http;

import '../page-1/modal/InputBox.dart';
import '../page-1/modal/SimpleInputBox.dart';
import '../page-1/modal/buttonModal.dart';
import '../page-1/modal/constant.dart';
import 'SplashScreen.dart';

class EditProfileDetails extends StatefulWidget {
  const EditProfileDetails({Key? key}) : super(key: key);

  @override
  State<EditProfileDetails> createState() => _EditProfileDetailsState();
}
Map getProfileData = Map();
class _EditProfileDetailsState extends State<EditProfileDetails> {
  var setheight = 35.00,
      setheight1 = 35.00,
      setheight2 = 35.00,
      setheight3 = 35.00,
      setheight4 = 35.00,
      setheight5 = 35.00,
      setheight7 = 35.00;
  var padding0 = EdgeInsetsDirectional.only(top: 0.0, bottom: 0),
      padding1 = EdgeInsetsDirectional.only(top: 0.0, bottom: 0),
      padding2 = EdgeInsetsDirectional.only(top: 0.0, bottom: 0),
      padding3 = EdgeInsetsDirectional.only(top: 0.0, bottom: 0),
      padding4 = EdgeInsetsDirectional.only(top: 0.0, bottom: 0),
      padding5 = EdgeInsetsDirectional.only(top: 0.0, bottom: 0),
      padding6 = EdgeInsetsDirectional.only(top: 0.0, bottom: 0),
      padding7 = EdgeInsetsDirectional.only(top: 0.0, bottom: 0);
  late FocusNode nameFocusNode = FocusNode()
    ..addListener(() {
      setState(() {});
    });
  late FocusNode emailFocusNode = FocusNode()
    ..addListener(() {
      setState(() {});
    });
  late FocusNode otpEmailFocusNode = FocusNode()
    ..addListener(() {
      setState(() {});
    });
  late FocusNode mobileNumberFocusNode = FocusNode()
    ..addListener(() {
      setState(() {});
    });
  late FocusNode otpMobileFocusNode = FocusNode()
    ..addListener(() {
      setState(() {});
    });
  late FocusNode addressFocusNode = FocusNode()
    ..addListener(() {
      setState(() {});
    });
  late FocusNode idDocumentFocusNumber = FocusNode()
    ..addListener(() {
      setState(() {});
    });
  late FocusNode idNumberFocusNumber = FocusNode()
    ..addListener(() {
      setState(() {});
    });
  Map SendOTPData =Map();

  var emailotperror;

  var mobileotperror;
  Future getProfile() async {
    try {
      var headers = {
        'x-access-token': '$globalusertoken',
        'Cookie': 'ci_session=a5bbae753d1b62cac569324d3757360af82f2712'
      };
      var request = http.MultipartRequest(
          'GET', Uri.parse('http://thenirmanstore.com/v1/seller/get_profile'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var data = await response.stream.bytesToString();
      setState(() {
        getProfileData = jsonDecode(data);
      });

      if (response.statusCode == 200) {
        if (getProfileData['status'] == 1) {
          print(getProfileData);
          print(getProfileData['data']['profile_pic']==null?'sdfds':'kdjfnkjd');
          nameController.text = getProfileData['data']['seller_name'];
          emailController.text = getProfileData['data']['email'];
          dobController.text = getProfileData['data']['dob'];
          mobileNumberController.text = getProfileData['data']['mobile_no'];
          addressController.text = getProfileData['data']['address'];
          pinController.text = getProfileData['data']['address_pin_code'];








        } else {}
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e);
    }
  }

  Future updateProfile(mobile_no,email_id,shop_address)async{
    var headers = {
      'x-access-token': 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6MTcsImlhdCI6MTY4OTkyNjYyM30.Yslv-b9x1w3L08SAPUX1BKQeuYC_Y4zydDKVcTgEhkM',
      'Cookie': 'ci_session=5eb5280fea158e9d43d892f6cac287fdb7179821'
    };
    var request = http.MultipartRequest('POST', Uri.parse('http://thenirmanstore.com/v1/seller/edit_profile'));
    request.fields.addAll({
      'device_token': 'TFTFFGHHHHHHHHHHHHHHHHHU',
      'id_number': getProfileData['data']['id_number'],
      'mobile_no': mobile_no,
      'email_id': email_id,
      'shop_address': shop_address,
      'seller_name': 'raj'
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }

  }

  Future SendOTP(
      type,
      mobile_no,
      ) async {
    try {
      var headers = {
        'Cookie': 'ci_session=23fdf7723748242a247650083cd62dee4f8af07d'
      };
      var request = http.MultipartRequest(
          'POST', Uri.parse('https://thenirmanstore.com/v1/seller/send_otp'));
      request.fields.addAll({'type': '$type', 'mobile_no': mobile_no});

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      var data = await response.stream.bytesToString();
      SendOTPData = jsonDecode(data);
      print('api called');
      print(SendOTPData);
      if (response.statusCode == 200) {
        if (SendOTPData['status'] == 1) {
          setState(() {
            otpmobileController.text = SendOTPData['data']['otp'];
            mobileotperror = null;
          });
        } else {
          setState(() {
            mobileotperror = SendOTPData['message'];
          });
        }

        print(SendOTPData);
        print(mobileotperror);
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {}
  }

  Future SendOTPEmail(type, email) async {
    try {
      var headers = {
        'Cookie': 'ci_session=23fdf7723748242a247650083cd62dee4f8af07d'
      };
      var request = http.MultipartRequest(
          'POST', Uri.parse('https://thenirmanstore.com/v1/seller/send_otp'));
      request.fields.addAll({'type': '$type', 'email_id': email});

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      var data = await response.stream.bytesToString();
      SendOTPData = jsonDecode(data);
      print('api called');
      print(SendOTPData);
      if (response.statusCode == 200) {
        if (SendOTPData['status'] == 1) {
          setState(() {
            otpemailController.text = SendOTPData['data']['otp'];
            print(emailController);
            emailotperror = null;
          });
        } else {
          setState(() {
            emailotperror = SendOTPData['message'];
          });
        }

        print(SendOTPData);
        print(emailotperror);
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e);
    }
  }
  TextEditingController nameController = TextEditingController();
  TextEditingController otpemailController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController pinController = TextEditingController();
  TextEditingController idNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController otpmobileController = TextEditingController();
  TextEditingController panController = TextEditingController();
  TextEditingController tanController = TextEditingController();
  TextEditingController gstinController = TextEditingController();
  TextEditingController udyamController = TextEditingController();
  TextEditingController createPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController idDocumentController = TextEditingController();
  TextEditingController dobController = TextEditingController();



  List<String> categoryList = [
    "Machinery",
    "Construction Material",
    "Equipments"
  ];
  @override
  void initState() {
    getProfile();

    super.initState();
  }
  var dropdownvalue;
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    late FocusNode focusNode = FocusNode()
      ..addListener(() {
        setState(() {});
      });

    return Scaffold(
      body: getProfileData==null?Center(child: CircularProgressIndicator(),):
      SingleChildScrollView(
        child: Container(

          child: FutureBuilder(
            builder: (context, snapshot) {
              return SingleChildScrollView(
                child: Column(

                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 16),
                      child: Column(
                        children: [


                          Container(
                              width: MediaQuery.of(context).size.width * 0.31,
                              height: MediaQuery.of(context).size.height * 0.2,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      colorFilter:
                                      ColorFilter.linearToSrgbGamma(),
                                      fit: BoxFit.contain,
                                      filterQuality: FilterQuality.high,
                                      image: AssetImage(
                                          'assets/page-1/images/user_icon.png')))),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Add Profile Photo',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: ThemeColorImageText,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                    Text(
                      "Full Name",
                      style: fontstyle,
                    ),
                    Opacity(
                      opacity: 0.99,
                      child: Container(
                        height: setheight,
                        margin: EdgeInsets.only(
                          bottom: 15,
                          top: 8,
                        ),
                        child: SizedBox(
                          child: TextFormField(
                            controller: nameController,
                            keyboardType: TextInputType.name,
                            focusNode: nameFocusNode,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                setState(() {
                                  setheight = 55;
                                });

                                return "Please enter your name";
                              } else {
                                setState(() {
                                  setheight = 35;
                                });
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: nameFocusNode.hasFocus
                                      ? ThemeColorYellow
                                      : ThemeColortext,
                                ),

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
                    ),
                    otpHeader(
                      ffem: ffem,
                      fem: fem,
                      firstText: 'Email Address ',
                      secondText: '(An OTP will be sent to this mail)',
                    ),
                    Opacity(
                      opacity: 0.99,
                      child: Container(
                        margin: EdgeInsets.only(
                          bottom: 15,
                          top: 8,
                        ),
                        height: setheight1,
                        child: TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          focusNode: emailFocusNode,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              setState(() {
                                setheight1 = 55;
                                padding0 =
                                    EdgeInsetsDirectional.only(top: 8.0, bottom: 8);
                              });
                              return "Please enter your email";
                            } else {
                              setState(() {
                                setheight1 = 35;
                                padding0 =
                                    EdgeInsetsDirectional.only(top: 0.0, bottom: 0);
                              });
                            }
                            // Add email format validation here if needed
                            return null;
                          },
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: emailFocusNode.hasFocus
                                    ? ThemeColorYellow
                                    : ThemeColortext,
                              ),
                              suffixStyle: TextField.materialMisspelledTextStyle,
                              suffixIcon: Container(
                                padding: padding0,
                                margin: EdgeInsets.all(1),
                                height: 1,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: ThemeColorYellow,
                                  ),
                                  onPressed: () {
                                    SendOTPEmail(
                                        "2", emailController.text.toString());
                                  },
                                  child: Text(
                                    "Get OTP",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ),
                                ),
                              ),
                              hintText: "Email",
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
                    if (emailotperror != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 3, bottom: 10.0),
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.all(0),
                              child: Row(
                                children: [
                                  Container(
                                      width:
                                      MediaQuery.of(context).size.width - 100,
                                      child: Text(
                                        "$emailotperror",
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 13),
                                      )),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    Text(
                      "Enter OTP received on mail",
                      style: fontstyle,
                    ),
                    Opacity(
                      opacity: 0.99,
                      child: Container(
                        margin: EdgeInsets.only(
                          bottom: 15,
                          top: 8,
                        ),
                        height: setheight2,
                        child: TextFormField(
                          controller: otpemailController,
                          keyboardType: TextInputType.number,
                          focusNode: otpEmailFocusNode,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              setState(() {
                                setheight2 = 55;
                              });
                              return "Please enter the OTP";
                            } else {
                              setState(() {
                                setheight2 = 35;
                              });
                            }
                            // Add validation for OTP format if needed
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "OTP from Mail",
                              hintStyle: TextStyle(
                                fontSize: 12,
                              ),
                              border: diableBorder,
                              focusedBorder: enableborder),
                        ),
                      ),
                    ),
                    Text(
                      "Mobile Number",
                      style: fontstyle,
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
                          controller: mobileNumberController,
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
                                color: mobileNumberFocusNode.hasFocus
                                    ? ThemeColorYellow
                                    : ThemeColortext,
                              ),
                              suffixIcon: Container(
                                padding: padding1,
                                height: 1,
                                margin: EdgeInsets.all(1),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: ThemeColorYellow,
                                  ),
                                  onPressed: () {
                                    SendOTP("1",
                                        mobileNumberController.text.toString());
                                  },
                                  child: Text(
                                    "Get OTP",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ),
                                ),
                              ),

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
                    if (mobileotperror != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 3, bottom: 10.0),
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.all(0),
                              child: Row(
                                children: [
                                  Container(
                                      width:
                                      MediaQuery.of(context).size.width - 100,
                                      child: Text(
                                        "$mobileotperror",
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 13),
                                      )),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    otpHeader(
                        ffem: ffem,
                        fem: fem,
                        firstText: "Mobile Number",
                        secondText: '(An OTP will be sent to this number)'),
                    Opacity(
                      opacity: 0.99,
                      child: Container(
                        margin: EdgeInsets.only(
                          bottom: 15,
                          top: 8,
                        ),
                        height: setheight4,
                        child: TextFormField(
                          controller: otpmobileController,
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
                    Text(
                      "Address",
                      style: fontstyle,
                    ),
                    Opacity(
                      opacity: 0.99,
                      child: Container(
                        margin: EdgeInsets.only(
                          bottom: 15,
                          top: 8,
                        ),
                        height: setheight5,
                        child: TextFormField(
                          controller: addressController,
                          keyboardType: TextInputType.text,
                          focusNode: addressFocusNode,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              setState(() {
                                setheight5 = 55;
                              });
                              return "Please enter your address";
                            } else {
                              setState(() {
                                setheight5 = 35;
                              });
                            }
                            // Add validation for mobile number format if needed
                            return null;
                          },
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.location_on_outlined,
                                color: addressFocusNode.hasFocus
                                    ? ThemeColorYellow
                                    : ThemeColortext,
                              ),
                              hintText: "Complete Address",
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
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 35),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15)),

                          // borderRadius: BorderRadius(
                          // topLeft: Radius.circular(60),
                          // topRight: Radius.circular(60)),
                          color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Full Name",
                            style: fontstyle,
                          ),
                          Opacity(
                            opacity: 0.99,
                            child: Container(
                              margin: EdgeInsets.only(
                                bottom: 15,
                                top: 8,
                              ),
                              height: 35,
                              child: TextFormField(
                                controller: nameController,
                                readOnly: true,
                                keyboardType:TextInputType.name,
                                focusNode: focusNode,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(

                                      left: 12,
                                    ),

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
                          ),

                          Text(
                            "Email ID",
                            style: fontstyle,
                          ),
                          Opacity(
                            opacity: 0.99,
                            child: Container(
                              margin: EdgeInsets.only(
                                bottom: 15,
                                top: 8,
                              ),
                              height: 35,
                              child: TextFormField(
                                controller: emailController,
                                keyboardType:TextInputType.emailAddress,
                                focusNode: focusNode,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                      left: 12,
                                    ),

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
                          ),


                          Text(
                            "Date of Birth",
                            style: fontstyle,
                          ),
                          Opacity(
                            opacity: 0.99,
                            child: Container(
                              margin: EdgeInsets.only(
                                bottom: 15,
                                top: 8,
                              ),
                              height: 35,
                              child: TextFormField(
                                controller: dobController,
                                keyboardType:TextInputType.datetime,
                                focusNode: focusNode,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                      left: 12,
                                    ),

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
                          ),

                          Text(
                            "Phone Number",
                            style: fontstyle,
                          ),
                          Opacity(
                            opacity: 0.99,
                            child: Container(
                              margin: EdgeInsets.only(
                                bottom: 15,
                                top: 8,
                              ),
                              height: 35,
                              child: TextFormField(
                                controller: mobileNumberController,
                                keyboardType:TextInputType.number,
                                focusNode: focusNode,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                      left: 12,
                                    ),

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
                          ),





                          Text(
                            "Personal Address",
                            style: fontstyle,
                          ),
                          Opacity(
                            opacity: 0.99,
                            child: Container(
                              margin: EdgeInsets.only(
                                bottom: 15,
                                top: 8,
                              ),
                              height: 35,
                              child: TextFormField(
                                controller: addressController,
                                keyboardType:TextInputType.text,
                                focusNode: focusNode,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                      left: 12,
                                    ),

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
                          ),


                          Text(
                            "Pin Code",
                            style: fontstyle,
                          ),
                          Opacity(
                            opacity: 0.99,
                            child: Container(
                              margin: EdgeInsets.only(
                                bottom: 15,
                                top: 8,
                              ),
                              height: 35,
                              child: TextFormField(
                                controller: pinController,
                                keyboardType:TextInputType.number,
                                focusNode: focusNode,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                      left: 12,
                                    ),

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
                          ),
                          Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.30,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: ThemeColorYellow,
                                    minimumSize: Size.fromHeight(32),
                                  ),
                                  onPressed: () {
                                // updateProfile(mobileNumberController.text.toString(), emailController.text.toString() );
                                  },
                                  child: Text(
                                    'Save',
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  )),
                            ),
                          )






                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
