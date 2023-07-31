import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nirmal_store/screens/AddProduct.dart';
import 'package:nirmal_store/screens/HomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../page-1/modal/Appbar.dart';
import '../page-1/modal/InputBox.dart';
import '../page-1/modal/button.dart';
import '../page-1/modal/buttonModal.dart';
import '../page-1/modal/constant.dart';
import '../page-1/modal/dropdownbutton.dart';
import '../utils.dart';
import 'Login.dart';
import 'home.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  Map SignUPData = Map();

  var apierror;
  void _setKey(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', key);
    print('set key');
  }

  Future SignUp(
      id_number,
      mobile_no,
      email_id,
      shop_address,
      seller_name,
      account_name,
      account_no,
      branch_name,
      bank_name,
      ifsc_code,
      cin_image,
      pan_iamge,
      tan_image,
      gstin_image,
      udyam_image) async {
    try {
      var headers = {
        'Cookie': 'ci_session=051d42079d07cf876dbc7c2f3aa3c7855647fc39'
      };
      var request = http.MultipartRequest(
          'POST', Uri.parse('https://thenirmanstore.com/v1/seller/signup'));
      request.fields.addAll({
        'id_number': id_number,
        'mobile_no': mobile_no,
        'email_id': email_id,
        'shop_address': shop_address,
        'seller_name': seller_name,
        'account_name': account_name,
        'account_no': account_no,
        'branch_name': branch_name,
        'bank_name': bank_name,
        'ifsc_code': ifsc_code
      });
      request.files.add(await http.MultipartFile.fromPath('cin', cin_image));
      request.files.add(await http.MultipartFile.fromPath('pan', pan_iamge));
      request.files.add(await http.MultipartFile.fromPath('tan', tan_image));
      request.files
          .add(await http.MultipartFile.fromPath('gstin', gstin_image));
      request.files
          .add(await http.MultipartFile.fromPath('udyam', udyam_image));
      request.headers.addAll(headers);
      print('api called');
      http.StreamedResponse response = await request.send();
      print('api called2');
      print(await response.stream.bytesToString());
      var data = await response.stream.bytesToString();

        SignUPData = jsonDecode(data);


      if (response.statusCode == 200) {
        if (SignUPData['status'] == 1) {
          _setKey(SignUPData['data']['token']);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        }
        apierror = SignUPData['message'];
        print(apierror);
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
  TextEditingController otpmobileController = TextEditingController();
  TextEditingController idNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cinController = TextEditingController();
  TextEditingController panController = TextEditingController();
  TextEditingController tanController = TextEditingController();
  TextEditingController gstinController = TextEditingController();
  TextEditingController udyamController = TextEditingController();
  TextEditingController createPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController idDocumentController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController accountNameController = TextEditingController();
  TextEditingController branchNameController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController ifscController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  var _image, _image1;
  var _image2, _image3;
  var _image4, _image5;
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
  late FocusNode idCinFocusNumber = FocusNode()
    ..addListener(() {
      setState(() {});
    });
  late FocusNode idPanFocusNumber = FocusNode()
    ..addListener(() {
      setState(() {});
    });
  late FocusNode idtanFocusNumber = FocusNode()
    ..addListener(() {
      setState(() {});
    });
  late FocusNode idGstinFocusNumber = FocusNode()
    ..addListener(() {
      setState(() {});
    });
  late FocusNode idUduamFocusNumber = FocusNode()
    ..addListener(() {
      setState(() {});
    });
  late FocusNode accountNumberFocusNumber = FocusNode()
    ..addListener(() {
      setState(() {});
    });
  late FocusNode accountNameFocusNumber = FocusNode()
    ..addListener(() {
      setState(() {});
    });
  late FocusNode branchNameFocusNumber = FocusNode()
    ..addListener(() {
      setState(() {});
    });
  late FocusNode bankNameFocusNumber = FocusNode()
    ..addListener(() {
      setState(() {});
    });
  late FocusNode ifscFocusNumber = FocusNode()
    ..addListener(() {
      setState(() {});
    });
  final picker = ImagePicker();
  var dropdownvalue;
  late FocusNode focusNode = FocusNode()
    ..addListener(() {
      setState(() {});
    });

  List<String> IdProofList = <String>['Aadhar Card', 'PAN Card', 'Voter ID'];

  var setheight = 35.00,
      setheight1 = 35.00,
      setheight2 = 35.00,
      setheight3 = 35.00,
      setheight4 = 35.00,
      setheight5 = 35.00,
      setheight7 = 35.00,
      setheight9 = 35.00,
      setheight10 = 35.00,
      setheight11 = 35.00,
      setheight12 = 35.00,
      setheight13 = 35.00,
      setheight14 = 35.00,
      setheight15 = 35.00,
      setheight16 = 35.00,
      setheight17 = 35.00,
      setheight18 = 35.00;
  var setheight8 = 35.00;

  var setheight6 = 52.00;

  var padding0 = EdgeInsetsDirectional.only(top: 0.0, bottom: 0),
      padding1 = EdgeInsetsDirectional.only(top: 0.0, bottom: 0),
      padding2 = EdgeInsetsDirectional.only(top: 0.0, bottom: 0),
      padding3 = EdgeInsetsDirectional.only(top: 0.0, bottom: 0),
      padding4 = EdgeInsetsDirectional.only(top: 0.0, bottom: 0),
      padding5 = EdgeInsetsDirectional.only(top: 0.0, bottom: 0),
      padding6 = EdgeInsetsDirectional.only(top: 0.0, bottom: 0),
      padding7 = EdgeInsetsDirectional.only(top: 0.0, bottom: 0),
      padding8 = EdgeInsetsDirectional.only(top: 0.0, bottom: 0),
      padding9 = EdgeInsetsDirectional.only(top: 0.0, bottom: 0),
      padding10 = EdgeInsetsDirectional.only(top: 0.0, bottom: 0),
      padding11 = EdgeInsetsDirectional.only(top: 0.0, bottom: 0),
      padding12 = EdgeInsetsDirectional.only(top: 0.0, bottom: 0);

  var mobileotperror;

  var emailotperror;

  String? Docname;
  String? Docname1;
  String? Docname2;
  String? Docname3;
  String? Docname4;
  String? Docname5;

  var error1, error2, error3, error4, error5, error6;

  Color borderColor1 = ThemeColorRed;
  var borderColor2;
  var borderColor3;
  var borderColor4;
  var borderColor5;
  var borderColor6;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    otpemailController.dispose();
    mobileNumberController.dispose();
    otpmobileController.dispose();
    addressController.dispose();
    idNumberController.dispose();
    idDocumentController.dispose();
    cinController.dispose();
    panController.dispose();
    tanController.dispose();
    gstinController.dispose();
    udyamController.dispose();
    accountNumberController.dispose();
    accountNameController.dispose();
    branchNameController.dispose();
    bankNameController.dispose();
    ifscController.dispose();

    super.dispose();
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

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    Future<void> _getImage1(ImageSource source) async {
      final pickedFile = await picker.pickImage(source: source);
      setState(() {
        if (pickedFile != null) {
          _image1 = File(pickedFile.path);

          Docname1 =
              File(pickedFile.path).path.split(Platform.pathSeparator).last;
        } else {
          print('No image selected.');
        }
      });
    }

    Future<void> _getImage2(ImageSource source) async {
      final pickedFile = await picker.pickImage(source: source);
      setState(() {
        if (pickedFile != null) {
          _image2 = File(pickedFile.path);

          Docname2 =
              File(pickedFile.path).path.split(Platform.pathSeparator).last;
        } else {
          print('No image selected.');
        }
      });
    }

    Future<void> _getImage3(ImageSource source) async {
      final pickedFile = await picker.pickImage(source: source);
      setState(() {
        if (pickedFile != null) {
          _image3 = File(pickedFile.path);

          Docname3 =
              File(pickedFile.path).path.split(Platform.pathSeparator).last;
        } else {
          print('No image selected.');
        }
      });
    }

    Future<void> _getImage4(ImageSource source) async {
      final pickedFile = await picker.pickImage(source: source);
      setState(() {
        if (pickedFile != null) {
          _image4 = File(pickedFile.path);

          Docname4 =
              File(pickedFile.path).path.split(Platform.pathSeparator).last;
        } else {
          print('No image selected.');
        }
      });
    }

    Future<void> _getImage5(ImageSource source) async {
      final pickedFile = await picker.pickImage(source: source);
      setState(() {
        if (pickedFile != null) {
          _image5 = File(pickedFile.path);

          Docname5 =
              File(pickedFile.path).path.split(Platform.pathSeparator).last;
        } else {
          print('No image selected.');
        }
      });
    }

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
                      "Register",
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
                ),
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.11,
            right: MediaQuery.of(context).size.width * 0.11,
          ),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    bottom: 45,
                    top: 10,
                  ),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'REGISTER',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont(
                            'Inter',
                            fontSize: 10 * ffem,
                            fontWeight: FontWeight.w500,
                            height: 2.4 * ffem / fem,
                            letterSpacing: 1.25 * fem,
                            color: Color(0xff000000),
                          ),
                        ),
                        Text(
                          'Please fill in the details',
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
                      ],
                    ),
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
                            hintText: 'Full Name',
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
                // Text(
                //   "ID Proof",
                //   style: fontstyle,
                // ),
                // Container(
                //   height: setheight6,
                //   margin: EdgeInsets.only(bottom: 20),
                //   child: DropdownButtonFormField<String>(
                //     decoration: InputDecoration(
                //       focusedBorder: OutlineInputBorder(
                //           borderSide: BorderSide(color: ThemeColorYellow)),
                //       border: OutlineInputBorder(
                //           borderSide: BorderSide(color: ThemeColoricon)),
                //       hintStyle: TextStyle(color: Colors.grey[800]),
                //     ),
                //     validator: (value) {
                //       {
                //         if (value == null || value.isEmpty) {
                //           setState(() {
                //             setheight6 = 52;
                //           });
                //           return "Please select option";
                //         } else {
                //           setState(() {
                //             setheight = 70;
                //           });
                //         }
                //         // Add validation for mobile number format if needed
                //         return null;
                //       }
                //     },
                //     isExpanded: true,
                //     icon: Icon(
                //       Icons.keyboard_arrow_down,
                //       color: focusNode.hasFocus
                //           ? ThemeColorYellow
                //           : ThemeColortext,
                //     ),
                //     hint: Text("Select Option"),
                //     elevation: 16,
                //     style: TextStyle(color: ThemeColorBlue, fontSize: 12),
                //     onChanged: (String? value) {
                //       dropdownvalue = value!;
                //       // This is called when the user selects an item.
                //       setState(() {
                //         dropdownvalue;
                //       });
                //     },
                //     value: dropdownvalue,
                //     items: IdProofList.map<DropdownMenuItem<String>>(
                //         (String value) {
                //       return DropdownMenuItem<String>(
                //         value: value,
                //         child: Text(
                //           value,
                //           style: TextStyle(color: ThemeColorBlue, fontSize: 12),
                //         ),
                //       );
                //     }).toList(),
                //   ),
                // ),
                Text(
                  "ID Number",
                  style: fontstyle,
                ),
                Opacity(
                  opacity: 0.99,
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: 5,
                      top: 8,
                    ),
                    height: setheight7,
                    child: TextFormField(
                      controller: idNumberController,
                      keyboardType: TextInputType.number,
                      focusNode: idNumberFocusNumber,
                      validator: (value) {
                        {
                          if (value == null || value.isEmpty) {
                            setState(() {
                              setheight7 = 55;
                            });
                            return "Please enter ID Number";
                          } else {
                            setState(() {
                              setheight7 = 35;
                            });
                          }
                          // Add validation for mobile number format if needed
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.insert_drive_file_outlined,
                          color: idNumberFocusNumber.hasFocus
                              ? ThemeColorYellow
                              : ThemeColortext,
                        ),
                        hintText: "Input the Number",
                        hintStyle: TextStyle(
                          fontSize: 12,
                        ),
                        prefix: SizedBox(
                          height: 20,
                        ),
                        border: diableBorder,
                        focusedBorder: enableborder,
                      ),
                    ),
                  ),
                ),
                Text(
                  "Account Name",
                  style: fontstyle,
                ),
                Opacity(
                  opacity: 0.99,
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: 5,
                      top: 8,
                    ),
                    height: setheight14,
                    child: TextFormField(
                      controller: accountNameController,
                      keyboardType: TextInputType.name,
                      focusNode: accountNameFocusNumber,
                      validator: (value) {
                        {
                          if (value == null || value.isEmpty) {
                            setState(() {
                              setheight14 = 55;
                            });
                            return "Please enter Account Name";
                          } else {
                            setState(() {
                              setheight14 = 35;
                            });
                          }
                          // Add validation for mobile number format if needed
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.account_box_outlined,
                          color: accountNameFocusNumber.hasFocus
                              ? ThemeColorYellow
                              : ThemeColortext,
                        ),
                        hintText: "Account Name",
                        hintStyle: TextStyle(
                          fontSize: 12,
                        ),
                        prefix: SizedBox(
                          height: 20,
                        ),
                        border: diableBorder,
                        focusedBorder: enableborder,
                      ),
                    ),
                  ),
                ),
                Text(
                  "Account Number",
                  style: fontstyle,
                ),
                Opacity(
                  opacity: 0.99,
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: 5,
                      top: 8,
                    ),
                    height: setheight15,
                    child: TextFormField(
                      controller: accountNumberController,
                      keyboardType: TextInputType.number,
                      focusNode: accountNumberFocusNumber,
                      validator: (value) {
                        {
                          if (value == null || value.isEmpty) {
                            setState(() {
                              setheight15 = 55;
                            });
                            return "Please enter Account Number";
                          } else {
                            setState(() {
                              setheight15 = 35;
                            });
                          }
                          // Add validation for mobile number format if needed
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.account_balance,
                          color: accountNumberFocusNumber.hasFocus
                              ? ThemeColorYellow
                              : ThemeColortext,
                        ),
                        hintText: "Input the Account Number",
                        hintStyle: TextStyle(
                          fontSize: 12,
                        ),
                        prefix: SizedBox(
                          height: 20,
                        ),
                        border: diableBorder,
                        focusedBorder: enableborder,
                      ),
                    ),
                  ),
                ),
                Text(
                  "Branch Name",
                  style: fontstyle,
                ),
                Opacity(
                  opacity: 0.99,
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: 5,
                      top: 8,
                    ),
                    height: setheight16,
                    child: TextFormField(
                      controller: branchNameController,
                      keyboardType: TextInputType.name,
                      focusNode: branchNameFocusNumber,
                      validator: (value) {
                        {
                          if (value == null || value.isEmpty) {
                            setState(() {
                              setheight16 = 55;
                            });
                            return "Please enter Branch Name";
                          } else {
                            setState(() {
                              setheight16 = 35;
                            });
                          }
                          // Add validation for mobile number format if needed
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.account_balance,
                          color: branchNameFocusNumber.hasFocus
                              ? ThemeColorYellow
                              : ThemeColortext,
                        ),
                        hintText: "Input the Branch Name",
                        hintStyle: TextStyle(
                          fontSize: 12,
                        ),
                        prefix: SizedBox(
                          height: 20,
                        ),
                        border: diableBorder,
                        focusedBorder: enableborder,
                      ),
                    ),
                  ),
                ),
                Text(
                  "Bank Name",
                  style: fontstyle,
                ),
                Opacity(
                  opacity: 0.99,
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: 5,
                      top: 8,
                    ),
                    height: setheight17,
                    child: TextFormField(
                      controller: bankNameController,
                      keyboardType: TextInputType.name,
                      focusNode: bankNameFocusNumber,
                      validator: (value) {
                        {
                          if (value == null || value.isEmpty) {
                            setState(() {
                              setheight17 = 55;
                            });
                            return "Please enter Bank Name";
                          } else {
                            setState(() {
                              setheight17 = 35;
                            });
                          }
                          // Add validation for mobile number format if needed
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.account_balance,
                          color: bankNameFocusNumber.hasFocus
                              ? ThemeColorYellow
                              : ThemeColortext,
                        ),
                        hintText: "Input the Bank Name",
                        hintStyle: TextStyle(
                          fontSize: 12,
                        ),
                        prefix: SizedBox(
                          height: 20,
                        ),
                        border: diableBorder,
                        focusedBorder: enableborder,
                      ),
                    ),
                  ),
                ),
                Text(
                  "IFSC Code",
                  style: fontstyle,
                ),
                Opacity(
                  opacity: 0.99,
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: 5,
                      top: 8,
                    ),
                    height: setheight18,
                    child: TextFormField(
                      controller: ifscController,
                      keyboardType: TextInputType.text,
                      focusNode: ifscFocusNumber,
                      validator: (value) {
                        {
                          if (value == null || value.isEmpty) {
                            setState(() {
                              setheight18 = 55;
                            });
                            return "Please enter IFSC Code";
                          } else {
                            setState(() {
                              setheight18 = 35;
                            });
                          }
                          // Add validation for mobile number format if needed
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.insert_drive_file_outlined,
                          color: idNumberFocusNumber.hasFocus
                              ? ThemeColorYellow
                              : ThemeColortext,
                        ),
                        hintText: "Input the IFSC Code",
                        hintStyle: TextStyle(
                          fontSize: 12,
                        ),
                        prefix: SizedBox(
                          height: 20,
                        ),
                        border: diableBorder,
                        focusedBorder: enableborder,
                      ),
                    ),
                  ),
                ),
                // Text(
                //   "UpLoad ID Document",
                //   style: fontstyle,
                // ),
                // Opacity(
                //   opacity: 0.99,
                //   child: Container(
                //     height: setheight8,
                //     margin: EdgeInsets.only(
                //       bottom: 5,
                //       top: 8,
                //     ),
                //     child: TextFormField(
                //       key: UniqueKey(),
                //       readOnly: true,
                //       initialValue: Docname ?? '',
                //       keyboardType: TextInputType.multiline,
                //       focusNode: idDocumentFocusNumber,
                //       validator: (value) {
                //         {
                //           if (value == null || value.isEmpty) {
                //             setState(() {
                //               error1 = "Please upload document";
                //               borderColor1=Colors.red;
                //
                //             });
                //             return "Please upload document";
                //           } else {
                //             setState(() {
                //               padding2 = EdgeInsetsDirectional.only(
                //                   top: 0.0, bottom: 0);
                //               borderColor1=ThemeColoricon;
                //               error1= null;
                //             });
                //           }
                //           // Add validation for mobile number format if needed
                //           return null;
                //         }
                //       },
                //       style: TextStyle(fontSize: 14),
                //       decoration: InputDecoration(
                //           contentPadding: EdgeInsets.symmetric(
                //               vertical: 0.0, horizontal: 0.0),
                //           prefixIcon: Icon(
                //             Icons.insert_drive_file_outlined,
                //             color: idDocumentFocusNumber.hasFocus
                //                 ? ThemeColorYellow
                //                 : ThemeColortext,
                //           ),
                //           suffixIcon: Container(
                //             margin: EdgeInsets.all(1),
                //             padding: padding2,
                //             height: 1,
                //             child: ElevatedButton(
                //               style: ElevatedButton.styleFrom(
                //                 backgroundColor: ThemeColorYellow,
                //               ),
                //               onPressed: () {
                //                 showModalBottomSheet(
                //                     context: context,
                //                     builder: (BuildContext context) {
                //                       return SafeArea(
                //                         child: Container(
                //                           child: Wrap(
                //                             children: [
                //                               ListTile(
                //                                 leading:
                //                                     Icon(Icons.photo_library),
                //                                 title: Text('Gallery'),
                //                                 onTap: () {
                //                                   _getImage(ImageSource.gallery);
                //                                   Navigator.pop(context);
                //                                 },
                //                               ),
                //                               ListTile(
                //                                 leading: Icon(Icons.camera_alt),
                //                                 title: Text('Camera'),
                //                                 onTap: () {
                //                                   _getImage(ImageSource.camera
                //                                       );
                //                                   Navigator.pop(context);
                //                                 },
                //                               ),
                //                             ],
                //                           ),
                //                         ),
                //                       );
                //                     });
                //               },
                //               child: Text(
                //                 "Choose",
                //                 style: TextStyle(
                //                     color: Colors.black, fontSize: 10),
                //               ),
                //             ),
                //           ),
                //           hintText: "Choose file",
                //           hintStyle: TextStyle(
                //             fontSize: 12,
                //           ),
                //           prefix: SizedBox(
                //             height: 20,
                //           ),
                //           border:  OutlineInputBorder(
                //               borderSide: BorderSide(
                //                   color: borderColor1)),
                //           errorBorder: OutlineInputBorder(
                //               borderSide: BorderSide(
                //                   color: Colors.red)),
                //           focusedBorder: enableborder),
                //     ),
                //   ),
                // ),
                // if (error1 != null)
                //   Padding(
                //     padding: const EdgeInsets.only(top: 3, bottom: 10.0,left: 10),
                //     child: Column(
                //       children: [
                //         Container(
                //           width: MediaQuery.of(context).size.width,
                //           padding: EdgeInsets.all(0),
                //           child: Row(
                //             children: [
                //               Container(
                //                   width:
                //                   MediaQuery.of(context).size.width - 100,
                //                   child: Text(
                //                     "Please upload document",
                //                     style: TextStyle(
                //                         color: Colors.red, fontSize: 13),
                //                   )),
                //             ],
                //           ),
                //         )
                //       ],
                //     ),
                //   ),

                Text(
                  "UpLoad CIN",
                  style: fontstyle,
                ),
                Opacity(
                  opacity: 0.99,
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: 5,
                      top: 8,
                    ),
                    height: setheight9,
                    child: TextFormField(
                      key: UniqueKey(),
                      initialValue: Docname1,
                      readOnly: true,
                      keyboardType: TextInputType.none,
                      focusNode: idCinFocusNumber,
                      validator: (value) {
                        {
                          if (value == null || value.isEmpty) {
                            setState(() {
                              error2 = "Please upload document";
                            });
                            return "Please upload document";
                          } else {
                            setState(() {
                              setheight9 = 35;
                              padding3 = EdgeInsetsDirectional.only(
                                  top: 0.0, bottom: 0);
                              error2 = null;
                            });
                          }
                          // Add validation for mobile number format if needed
                          return null;
                        }
                      },
                      style: TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                          prefixIcon: Icon(
                            Icons.insert_drive_file_outlined,
                            color: idCinFocusNumber.hasFocus
                                ? ThemeColorYellow
                                : ThemeColortext,
                          ),
                          suffixIcon: Container(
                            margin: EdgeInsets.all(1),
                            padding: padding3,
                            height: 1,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ThemeColorYellow,
                              ),
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return SafeArea(
                                        child: Container(
                                          child: Wrap(
                                            children: [
                                              ListTile(
                                                leading:
                                                    Icon(Icons.photo_library),
                                                title: Text('Gallery'),
                                                onTap: () {
                                                  _getImage1(
                                                      ImageSource.gallery);
                                                  Navigator.pop(context);
                                                },
                                              ),
                                              ListTile(
                                                leading: Icon(Icons.camera_alt),
                                                title: Text('Camera'),
                                                onTap: () {
                                                  _getImage1(
                                                      ImageSource.camera);
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              },
                              child: Text(
                                "Choose",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 10),
                              ),
                            ),
                          ),
                          hintText: "Choose file",
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
                if (error2 != null)
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 3, bottom: 10.0, left: 10),
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
                                    "Please upload document",
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
                  "Upload PAN",
                  style: fontstyle,
                ),
                Opacity(
                  opacity: 0.99,
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: 5,
                      top: 8,
                    ),
                    height: setheight10,
                    child: TextFormField(
                      key: UniqueKey(),
                      initialValue: Docname2,
                      readOnly: true,
                      keyboardType: TextInputType.none,
                      focusNode: idPanFocusNumber,
                      style: TextStyle(fontSize: 14),
                      validator: (value) {
                        {
                          if (value == null || value.isEmpty) {
                            setState(() {
                              error3 = "Please upload document";
                            });
                            return "Please upload document";
                          } else {
                            setState(() {
                              setheight10 = 35;
                              padding4 = EdgeInsetsDirectional.only(
                                  top: 0.0, bottom: 0);
                              error3 = null;
                            });
                          }
                          // Add validation for mobile number format if needed
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                          prefixIcon: Icon(
                            Icons.insert_drive_file_outlined,
                            color: idPanFocusNumber.hasFocus
                                ? ThemeColorYellow
                                : ThemeColortext,
                          ),
                          suffixIcon: Container(
                            margin: EdgeInsets.all(1),
                            height: 1,
                            padding: padding4,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ThemeColorYellow,
                              ),
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return SafeArea(
                                        child: Container(
                                          child: Wrap(
                                            children: [
                                              ListTile(
                                                leading:
                                                    Icon(Icons.photo_library),
                                                title: Text('Gallery'),
                                                onTap: () {
                                                  _getImage2(
                                                    ImageSource.gallery,
                                                  );
                                                  Navigator.pop(context);
                                                },
                                              ),
                                              ListTile(
                                                leading: Icon(Icons.camera_alt),
                                                title: Text('Camera'),
                                                onTap: () {
                                                  _getImage2(
                                                    ImageSource.camera,
                                                  );
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              },
                              child: Text(
                                "Choose",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 10),
                              ),
                            ),
                          ),
                          hintText: "Choose file",
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
                if (error3 != null)
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 3, bottom: 10.0, left: 10),
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
                                    "Please upload document",
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
                  "UPload TAN",
                  style: fontstyle,
                ),
                Opacity(
                  opacity: 0.99,
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: 5,
                      top: 8,
                    ),
                    height: setheight11,
                    child: TextFormField(
                      key: UniqueKey(),
                      initialValue: Docname3,
                      readOnly: true,
                      keyboardType: TextInputType.none,
                      focusNode: idtanFocusNumber,
                      validator: (value) {
                        {
                          if (value == null || value.isEmpty) {
                            setState(() {
                              error4 = "Please upload document";
                            });
                            return "Please upload document";
                          } else {
                            setState(() {
                              setheight11 = 35;
                              padding5 = EdgeInsetsDirectional.only(
                                  top: 0.0, bottom: 0);
                              error4 = null;
                            });
                          }
                          // Add validation for mobile number format if needed
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                          prefixIcon: Icon(
                            Icons.insert_drive_file_outlined,
                            color: idtanFocusNumber.hasFocus
                                ? ThemeColorYellow
                                : ThemeColortext,
                          ),
                          suffixIcon: Container(
                            margin: EdgeInsets.all(1),
                            height: 1,
                            padding: padding5,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ThemeColorYellow,
                              ),
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return SafeArea(
                                        child: Container(
                                          child: Wrap(
                                            children: [
                                              ListTile(
                                                leading:
                                                    Icon(Icons.photo_library),
                                                title: Text('Gallery'),
                                                onTap: () {
                                                  _getImage3(
                                                    ImageSource.gallery,
                                                  );
                                                  Navigator.pop(context);
                                                },
                                              ),
                                              ListTile(
                                                leading: Icon(Icons.camera_alt),
                                                title: Text('Camera'),
                                                onTap: () {
                                                  _getImage3(
                                                    ImageSource.camera,
                                                  );
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              },
                              child: Text(
                                "Choose",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 10),
                              ),
                            ),
                          ),
                          hintText: "Choose file",
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
                if (error4 != null)
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 3, bottom: 10.0, left: 10),
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
                                    "Please upload document",
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
                  "Upload GSTIN",
                  style: fontstyle,
                ),
                Opacity(
                  opacity: 0.99,
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: 5,
                      top: 8,
                    ),
                    height: setheight12,
                    child: TextFormField(
                      key: UniqueKey(),
                      initialValue: Docname4,
                      keyboardType: TextInputType.none,
                      readOnly: true,
                      focusNode: idGstinFocusNumber,
                      validator: (value) {
                        {
                          if (value == null || value.isEmpty) {
                            setState(() {
                              error5 = "Please upload document";
                            });
                            return "Please upload document";
                          } else {
                            setState(() {
                              error5 = null;
                            });
                          }
                          // Add validation for mobile number format if needed
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                          prefixIcon: Icon(
                            Icons.insert_drive_file_outlined,
                            color: idGstinFocusNumber.hasFocus
                                ? ThemeColorYellow
                                : ThemeColortext,
                          ),
                          suffixIcon: Container(
                            margin: EdgeInsets.all(1),
                            height: 1,
                            padding: padding6,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ThemeColorYellow,
                              ),
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return SafeArea(
                                        child: Container(
                                          child: Wrap(
                                            children: [
                                              ListTile(
                                                leading:
                                                    Icon(Icons.photo_library),
                                                title: Text('Gallery'),
                                                onTap: () {
                                                  _getImage4(
                                                    ImageSource.gallery,
                                                  );
                                                  Navigator.pop(context);
                                                },
                                              ),
                                              ListTile(
                                                leading: Icon(Icons.camera_alt),
                                                title: Text('Camera'),
                                                onTap: () {
                                                  _getImage4(
                                                    ImageSource.camera,
                                                  );
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              },
                              child: Text(
                                "Choose",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 10),
                              ),
                            ),
                          ),
                          hintText: "Choose file",
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
                if (error5 != null)
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 3, bottom: 10.0, left: 10),
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
                                    "Please upload document",
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
                  "Upload UDYAM",
                  style: fontstyle,
                ),
                Opacity(
                  opacity: 0.99,
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: 5,
                      top: 8,
                    ),
                    height: setheight13,
                    child: TextFormField(
                      key: UniqueKey(),
                      initialValue: Docname5,
                      readOnly: true,
                      keyboardType: TextInputType.none,
                      focusNode: idUduamFocusNumber,
                      validator: (value) {
                        {
                          if (value == null || value.isEmpty) {
                            setState(() {
                              error6 = "Please upload document";
                            });
                            return "Please upload document";
                          } else {
                            setState(() {
                              setheight13 = 35;
                              padding7 = EdgeInsetsDirectional.only(
                                  top: 0.0, bottom: 0);
                              error6 = null;
                            });
                          }
                          // Add validation for mobile number format if needed
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                          prefixIcon: Icon(
                            Icons.insert_drive_file_outlined,
                            color: idUduamFocusNumber.hasFocus
                                ? ThemeColorYellow
                                : ThemeColortext,
                          ),
                          suffixIcon: Container(
                            margin: EdgeInsets.all(1),
                            height: 1,
                            padding: padding7,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ThemeColorYellow,
                              ),
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return SafeArea(
                                        child: Container(
                                          child: Wrap(
                                            children: [
                                              ListTile(
                                                leading:
                                                    Icon(Icons.photo_library),
                                                title: Text('Gallery'),
                                                onTap: () {
                                                  _getImage5(
                                                    ImageSource.gallery,
                                                  );
                                                  Navigator.pop(context);
                                                },
                                              ),
                                              ListTile(
                                                leading: Icon(Icons.camera_alt),
                                                title: Text('Camera'),
                                                onTap: () {
                                                  _getImage5(
                                                    ImageSource.camera,
                                                  );
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              },
                              child: Text(
                                "Choose",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 10),
                              ),
                            ),
                          ),
                          hintText: "Choose file",
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
                if (error6 != null)
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 3, bottom: 10.0, left: 10),
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
                                    "Please upload document",
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 13),
                                  )),
                            ],
                          ),
                        )
                      ],
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
                          if (formkey.currentState!.validate()) {
                            SignUp(
                                idNumberController.text,
                                mobileNumberController.text.toString(),
                                emailController.text.toString(),
                                addressController.text.toString(),
                                nameController.text.toString(),
                                accountNameController.text.toString(),
                                accountNumberController.text.toString(),
                                branchNameController.text.toString(),
                                branchNameController.text.toString(),
                                ifscController.text.toString(),
                                _image1.path,
                                _image2.path,
                                _image3.path,
                                _image4.path,
                                _image5.path);
                          }
                          ;


                        },
                        child: Text(
                          'REGISTER',
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        )),
                  ),
                ),
                showAlert(),

                Container(
                  margin: EdgeInsets.only(bottom: 50),
                  child: navigateText(
                    ffem: ffem,
                    fem: fem,
                    function: Login(),
                    text: 'Already have an account?',
                    buttonText: 'Log In',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget showAlert() {
    if (apierror != null) {
      return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.error_outline_outlined, color: Colors.red),
            ),
            Container(
                child: Text(
              "$apierror",
              style: TextStyle(color: Colors.red),
            )),
          ],
        ),
      );
    }
    return SizedBox(
      height: 0,
    );
  }
}

class otpHeader extends StatelessWidget {
  const otpHeader({
    super.key,
    required this.ffem,
    required this.fem,
    required this.firstText,
    required this.secondText,
  });

  final double ffem;
  final double fem;
  final String firstText, secondText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          firstText,
          style: SafeGoogleFont(
            'Inter',
            fontSize: 12 * ffem,
            fontWeight: FontWeight.w500,
            height: 2 * ffem / fem,
            letterSpacing: -0.0900000036 * fem,
            color: Color(0xff07090d),
          ),
        ),
        Text(
          secondText,
          style: SafeGoogleFont(
            'Inter',
            fontSize: 12 * ffem,
            fontWeight: FontWeight.w500,
            height: 2 * ffem / fem,
            letterSpacing: -0.0900000036 * fem,
            color: Color(0xff8f8f8f),
          ),
        )
      ],
    );
  }
}
