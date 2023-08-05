import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nirmal_store/screens/Registration.dart';
import 'package:http/http.dart' as http;

import '../page-1/modal/InputBox.dart';
import '../page-1/modal/SimpleInputBox.dart';
import '../page-1/modal/buttonModal.dart';
import '../page-1/modal/constant.dart';
import 'AddProduct.dart';
import 'Profile.dart';
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
  late FocusNode shopaddressFocusNode = FocusNode()
    ..addListener(() {
      setState(() {});
    });
  late FocusNode idNumberFocusNumber = FocusNode()
    ..addListener(() {
      setState(() {});
    });
  Map SendOTPData = Map();

  var emailotperror;

  var mobileotperror;

  var setheight8 = 35.00;
  Future getProfile() async {
    try {
      var headers = {
        'x-access-token': '$getProfileData',
        'Cookie': 'ci_session=725714725132105aa4e6493fd676b54ac54ffea4'
      };
      var request = http.MultipartRequest('GET', Uri.parse('http://thenirmanstore.com/v1/seller/get_profile'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      var data = await response.stream.bytesToString();
      print('api called');


      getProfileData = jsonDecode(data);

      if (response.statusCode == 200) {

        if (getProfileData['status'] == 1) {
          print(getProfileData);
          print(getProfileData['data']['profile_pic'] == null
              ? 'not found'
              : 'found');
          nameController.text = getProfileData['data']['seller_name'];
          emailController.text = getProfileData['data']['email'];
          dobController.text = getProfileData['data']['dob'];
          mobileNumberController.text = getProfileData['data']['mobile_no'];
          addressController.text = getProfileData['data']['address'];
          pinController.text = getProfileData['data']['address_pin_code'];
          shopaddressController.text = getProfileData['data']['shop_address'];
          idNumberController.text = getProfileData['data']['id_number'];
        } else {}
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e);
    }
  }

Map updateProfileData = Map();
  Future updateProfile(mobile_no, email_id, shop_address, id_number,
      seller_name, address, profile_pic) async {
    try {
      var headers = {
        'x-access-token':'$getProfileData',
        'Cookie': 'ci_session=d02a9b91db803bcd984e94574add08a87f66f55e'
      };
      var request = http.MultipartRequest('POST', Uri.parse('http://thenirmanstore.com/v1/seller/get_profile'));
      request.fields.addAll({
        'id_number': id_number,
        'mobile_no': mobile_no,
        'email_id': email_id,
        'shop_address': shop_address,
        'seller_name': seller_name,
        'address': address
      });
      request.files.add(
          await http.MultipartFile.fromPath('profile_pic', profile_pic));
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
var data = await response.stream.bytesToString();
      if (response.statusCode == 200) {
        setState(() {
          updateProfileData = jsonDecode(data);
        });

        if (updateProfileData['status'] == 1) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => Profile()));
        } else {
          CircularProgressIndicator();
        }
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e);
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
          'POST', Uri.parse('http://thenirmanstore.com/v1/seller/send_otp'));
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
          'POST', Uri.parse('http://thenirmanstore.com/v1/seller/send_otp'));
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
  TextEditingController shopaddressController = TextEditingController();
  TextEditingController otpmobileController = TextEditingController();

  TextEditingController dobController = TextEditingController();
  var _image;
  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
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
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
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
      body: getProfileData.isEmpty&&getProfileData==null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(

                margin: EdgeInsets.only(left: 30,right: 30,top: 70,bottom: 20),
                child: SingleChildScrollView(
                  child: Form(
                    key: formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: CircleAvatar(
                            radius: 65,
                            backgroundColor: Colors.white,

                            // foregroundImage: _image == null
                            //     ? getProfileData['data']['profile_pic']?AssetImage('assets/images/user.png'):NetworkImage(getProfileData['data']['profile_pic'])as ImageProvider
                            //     : FileImage(_image)

                            //_image==null? FileImage(_image!):AssetImage('assets/images/fb.png')as ImageProvider

                          ),
                        ),
                        SizedBox(height: 10,),
                        Center(
                          child: TextButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return SafeArea(
                                        child: Container(

                                          child: Wrap(
                                            children: [
                                              ListTile(
                                                leading: Icon(Icons.photo_library),
                                                title: Text('Gallery'),
                                                onTap: () {
                                                  _getImage(ImageSource.gallery);
                                                  Navigator.pop(context);
                                                },
                                              ),
                                              ListTile(
                                                leading: Icon(Icons.camera_alt),
                                                title: Text('Camera'),
                                                onTap: () {
                                                  _getImage(ImageSource.camera);
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
                                'Change Profile Photo',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: ThemeColorImageText,
                                    fontWeight: FontWeight.bold),
                              )
                          ),
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
                                    contentPadding: EdgeInsets.zero,
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
                                    padding0 = EdgeInsetsDirectional.only(
                                        top: 8.0, bottom: 8);
                                  });
                                  return "Please enter your email";
                                } else {
                                  setState(() {
                                    setheight1 = 35;
                                    padding0 = EdgeInsetsDirectional.only(
                                        top: 0.0, bottom: 0);
                                  });
                                }
                                // Add email format validation here if needed
                                return null;
                              },
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
                                    color: emailFocusNode.hasFocus
                                        ? ThemeColorYellow
                                        : ThemeColortext,
                                  ),
                                  suffixStyle:
                                  TextField.materialMisspelledTextStyle,
                                  suffixIcon: Container(
                                    padding: padding0,
                                    margin: EdgeInsets.all(1),
                                    height: 1,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: ThemeColorYellow,
                                      ),
                                      onPressed: () {
                                        SendOTPEmail("2",
                                            emailController.text.toString());
                                      },
                                      child: Text(
                                        "Get OTP",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10),
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
                            padding:
                            const EdgeInsets.only(top: 3, bottom: 10.0),
                            child: Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.all(0),
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: [
                                      Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width -
                                              100,
                                          child: Text(
                                            "$emailotperror",
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 13),
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
                                  contentPadding: EdgeInsets.only(left: 10),
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
                                    padding1 = EdgeInsetsDirectional.only(
                                        top: 8.0, bottom: 8);
                                  });
                                  return "Please enter your mobile number";
                                } else if (value!.contains(',')) {
                                  setheight3 = 55;
                                  padding1 = EdgeInsetsDirectional.only(
                                      top: 8.0, bottom: 8);
                                  return "Invalid input. Please enter numbers only";
                                }
                                if (value.contains('.')) {
                                  setheight3 = 55;
                                  padding1 = EdgeInsetsDirectional.only(
                                      top: 8.0, bottom: 8);
                                  return "Invalid input. Please enter numbers only";
                                }
                                if (value.contains('-')) {
                                  setheight3 = 55;
                                  padding1 = EdgeInsetsDirectional.only(
                                      top: 8.0, bottom: 8);
                                  return "Invalid input. Please enter numbers only";
                                }
                                if (value.contains(' ')) {
                                  setheight3 = 55;
                                  padding1 = EdgeInsetsDirectional.only(
                                      top: 8.0, bottom: 8);
                                  return "Invalid input. Please enter numbers only without any spaces";
                                }

                                if (value.length < 10) {
                                  setheight3 = 55;
                                  padding1 = EdgeInsetsDirectional.only(
                                      top: 8.0, bottom: 8);
                                  return "Please enter full 10 digit number";
                                } else {
                                  setState(() {
                                    setheight3 = 35;
                                    padding1 = EdgeInsetsDirectional.only(
                                        top: 0.0, bottom: 0);
                                  });
                                }
                                // Add validation for mobile number format if needed
                                return null;
                              },
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(10)
                              ],
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.zero,
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
                                        SendOTP(
                                            "1",
                                            mobileNumberController.text
                                                .toString());
                                      },
                                      child: Text(
                                        "Get OTP",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10),
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
                            padding:
                            const EdgeInsets.only(top: 3, bottom: 10.0),
                            child: Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.all(0),
                                  child: Row(
                                    children: [
                                      Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width -
                                              100,
                                          child: Text(
                                            "$mobileotperror",
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 13),
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
                            secondText:
                            '(An OTP will be sent to this number)'),
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
                                  contentPadding: EdgeInsets.only(left: 10),
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
                          "Id Number",
                          style: fontstyle,
                        ),
                        Opacity(
                          opacity: 0.99,
                          child: Container(
                            margin: EdgeInsets.only(
                              bottom: 15,
                              top: 8,
                            ),
                            height: setheight8,
                            child: TextFormField(
                              controller: idNumberController,
                              keyboardType: TextInputType.text,
                              focusNode: idNumberFocusNumber,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  setState(() {
                                    setheight8 = 55;
                                  });
                                  return "Please enter your ID number";
                                } else {
                                  setState(() {
                                    setheight8 = 35;
                                  });
                                }
                                // Add validation for mobile number format if needed
                                return null;
                              },
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  prefixIcon: Icon(
                                    Icons.insert_drive_file_outlined,
                                    color: idNumberFocusNumber.hasFocus
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
                                  contentPadding: EdgeInsets.zero,
                                  prefixIcon: Icon(
                                    Icons.location_on_outlined,
                                    color: addressFocusNode.hasFocus
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
                        Text(
                          " Shop Address",
                          style: fontstyle,
                        ),
                        Opacity(
                          opacity: 0.99,
                          child: Container(
                            margin: EdgeInsets.only(
                              bottom: 15,
                              top: 8,
                            ),
                            height: setheight7,
                            child: TextFormField(
                              controller: shopaddressController,
                              keyboardType: TextInputType.text,
                              focusNode: shopaddressFocusNode,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  setState(() {
                                    setheight7 = 55;
                                  });
                                  return "Please enter your shop address";
                                } else {
                                  setState(() {
                                    setheight7 = 35;
                                  });
                                }
                                // Add validation for mobile number format if needed
                                return null;
                              },
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  prefixIcon: Icon(
                                    Icons.location_on_outlined,
                                    color: shopaddressFocusNode.hasFocus
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
                        Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.30,
                            margin: EdgeInsets.only(bottom: 40),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: ThemeColorYellow,
                                  minimumSize: Size.fromHeight(32),
                                ),
                                onPressed: () {
                                  if (formkey.currentState!.validate()) {
                                    var image;
                                    _image == null
                                        ? image = getProfileData['data']['profile_pic']
                                        : image = _image.path;

                                    updateProfile(
                                        mobileNumberController.text.toString(),
                                        emailController.text.toString(),
                                        shopaddressController.text.toString(),
                                        idNumberController.text.toString(),
                                        nameController.text.toString(),
                                        addressController.text.toString(),
                                        image);


                                  }

                                },
                                child: Text(
                                  'Save',
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ),
            ),
    );
  }
}
