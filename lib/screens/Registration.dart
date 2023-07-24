import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';

import '../page-1/modal/Appbar.dart';
import '../page-1/modal/InputBox.dart';
import '../page-1/modal/button.dart';
import '../page-1/modal/buttonModal.dart';
import '../page-1/modal/constant.dart';
import '../page-1/modal/dropdownbutton.dart';
import '../utils.dart';
import 'Login.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
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
  var dropdownvalue;
  late FocusNode focusNode = FocusNode()
    ..addListener(() {
      setState(() {});
    });

  List<String> IdProofList = <String>['Aadhar Card', 'PAN Card', 'Voter ID'];
  @override
  void dispose() {
    focusNode.dispose();
    nameController.dispose();
    otpemailController.dispose();
    emailController.dispose();
    mobileNumberController.dispose();
    otpmobileController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
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
                      // Text(
                      //   '(All fields are required)',
                      //   style: SafeGoogleFont (
                      //     'Inter',
                      //     fontSize: 12*ffem,
                      //     fontWeight: FontWeight.w500,
                      //     height: 2*ffem/fem,
                      //     letterSpacing: -0.0900000036*fem,
                      //     color: Color(0xff9b9b9b),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
              Text(
                "Full Name",
                style: fontstyle,
              ),
              InputBox(
                textInputType: TextInputType.name,
                prefixIconn: Icons.person,
                hintText: "Full Name",
                controller: nameController,
              ),
              otpHeader(
                ffem: ffem,
                fem: fem,
                firstText: 'Email Address ',
                secondText: '(An OTP will be sent to this mail)',
              ),
              InputBox(
                controller: emailController,
                hintText: "Email",
                prefixIconn: Icons.email_outlined, textInputType: TextInputType.emailAddress,
              ),
              Text(
                "Enter OTP received on mail",
                style: fontstyle,
              ),
              InputBox(
                controller: otpemailController,
                hintText: "OTP from Mail",

                textInputType: TextInputType.number,
                saffix: Container(
                  margin: EdgeInsets.all(1)
                  ,
                  height: 20,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ThemeColorYellow,

                    ),
                    onPressed: () {},
                    child: Text(
                      "VARIFY",
                      style: TextStyle(color: Colors.black, fontSize: 10),
                    ),
                  ),
                ),

              ),
              Text(
                "Mobile Number",
                style: fontstyle,
              ),
              InputBox(
                controller: mobileNumberController,
                hintText: "Mobile Number",

                textInputType: TextInputType.number,
                prefixIconn: Icons.phone_outlined,

              ),
              otpHeader(
                  ffem: ffem,
                  fem: fem,
                  firstText: "Mobile Number",
                  secondText: '(An OTP will be sent to this number)'),
              InputBox(
                controller: otpemailController,
                hintText: "OTP from Mobile",
                textInputType: TextInputType.number,
                saffix: Container(
                  margin: EdgeInsets.all(1),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ThemeColorYellow,

                    ),
                    onPressed: () {},
                    child: Text(
                      "VARIFY",
                      style: TextStyle(color: Colors.black, fontSize: 10),
                    ),
                  ),
                ),
              ),
              Text(
                "Address",
                style: fontstyle,
              ),
              InputBox(

                textInputType: TextInputType.streetAddress,
                controller: addressController,
                hintText: "Complete Address",
                prefixIconn: Icons.location_on_outlined,
              ),
              Text(
                "ID Proof",
                style: fontstyle,
              ),
              Container(
                height: 52,
                margin: EdgeInsets.only(bottom: 20),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: ThemeColorYellow)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: ThemeColoricon)),
                    hintStyle: TextStyle(color: Colors.grey[800]),
                  ),
                  isExpanded: true,
                  icon:
                  Icon(Icons.keyboard_arrow_down,color:focusNode.hasFocus ? ThemeColorYellow : ThemeColortext ,),

                  hint: Text("Select Option"),
                  elevation: 16,
                  style: TextStyle(color: ThemeColorBlue, fontSize: 12),
                  onChanged: (String? value) {
                    dropdownvalue = value!;
                    // This is called when the user selects an item.
                    setState(() {
                      dropdownvalue;
                    });
                  },
                  value: dropdownvalue,
                  items:
                      IdProofList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(color: ThemeColorBlue, fontSize: 12),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Text(
                "ID Number",
                style: fontstyle,
              ),
              InputBox(
                textInputType: TextInputType.number,
                controller: idNumberController,
                hintText: "Input the Number",
                prefixIconn: Icons.insert_drive_file_outlined,
              ),
              Text(
                "UpLoad ID Document",
                style: fontstyle,
              ),
              InputBox(
                controller: idDocumentController,
                hintText: "Choose file",
                textInputType: TextInputType.none,
                prefixIconn: Icons.insert_drive_file_outlined,
                saffix: Container(
                    margin: EdgeInsets.all(1),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ThemeColorYellow,

                    ),
                    onPressed: () {},
                    child: Text(
                      "CHOOSE",
                      style: TextStyle(color: Colors.black, fontSize: 10),
                    ),
                  ),
                ),
              ),
              Text(
                "UpLoad CIN",
                style: fontstyle,
              ),
              InputBox(
                controller: cinController,
                textInputType: TextInputType.none,
                hintText: "Choose file",
                prefixIconn: Icons.insert_drive_file_outlined,
                saffix: Container(
                  margin: EdgeInsets.all(1),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ThemeColorYellow,

                    ),
                    onPressed: () {},
                    child: Text(
                      "CHOOSE",
                      style: TextStyle(color: Colors.black, fontSize: 10),
                    ),
                  ),
                ),
              ),
              Text(
                "Upload PAN",
                style: fontstyle,
              ),
              InputBox(
                textInputType: TextInputType.none,
                controller: panController,
                hintText: "Choose file",
                prefixIconn: Icons.insert_drive_file_outlined,
                saffix: Container(
                  margin: EdgeInsets.all(1),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ThemeColorYellow,

                    ),
                    onPressed: () {},
                    child: Text(
                      "CHOOSE",
                      style: TextStyle(color: Colors.black, fontSize: 10),
                    ),
                  ),
                ),
              ),
              Text(
                "UPload TAN",
                style: fontstyle,
              ),
              InputBox(
                textInputType: TextInputType.none,
                controller: tanController,
                hintText: "Choose file",
                prefixIconn: Icons.insert_drive_file_outlined,
                saffix: Container(
                  margin: EdgeInsets.all(1),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ThemeColorYellow,

                    ),
                    onPressed: () {},
                    child: Text(
                      "CHOOSE",
                      style: TextStyle(color: Colors.black, fontSize: 10),
                    ),
                  ),
                ),
              ),
              Text(
                "Upload GSTIN",
                style: fontstyle,
              ),
              InputBox(
                textInputType: TextInputType.none,
                controller: gstinController,
                hintText: "Choose file",
                prefixIconn: Icons.insert_drive_file_outlined,
                saffix: Container(
                  margin: EdgeInsets.all(1),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ThemeColorYellow,

                    ),
                    onPressed: () {},
                    child: Text(
                      "CHOOSE",
                      style: TextStyle(color: Colors.black, fontSize: 10),
                    ),
                  ),
                ),
              ),
              Text(
                "Upload UDYAM",
                style: fontstyle,
              ),
              InputBox(
                textInputType: TextInputType.none,
                controller: udyamController,
                hintText: "Choose file",
                prefixIconn: Icons.insert_drive_file_outlined,
                saffix: Container(
                  margin: EdgeInsets.all(1),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ThemeColorYellow,

                    ),
                    onPressed: () {},
                    child: Text(
                      "CHOOSE",
                      style: TextStyle(color: Colors.black, fontSize: 10),
                    ),
                  ),
                ),
              ),
              Text(
                "Create Password",
                style: fontstyle,
              ),
              InputBox(
                textInputType: TextInputType.visiblePassword,
                controller: createPasswordController,
                hintText: "Password",
                prefixIconn: Icons.lock_outline,
              ),
              Text(
                "Confirm Password",
                style: fontstyle,
              ),
              InputBox(
                textInputType: TextInputType.visiblePassword,
                controller: cinController,
                hintText: "Confirm Password",
                prefixIconn: Icons.lock_outline,
              ),
              ButtonModal(buttonText: "REGISTER",),
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
