import 'package:flutter/material.dart';
import 'package:nirmal_store/screens/Registration.dart';

import '../page-1/HomeScreen.dart';
import '../page-1/modal/InputBox.dart';
import '../page-1/modal/SimpleInputBox.dart';
import '../page-1/modal/buttonModal.dart';
import '../page-1/modal/constant.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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
  List<String> categoryList = [
    "Machinery",
    "Construction Material",
    "Equipments"
  ];
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
      body: SingleChildScrollView(
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
                          SimpleInputBox(
                            textInputType: TextInputType.name,

                            hintText: "Enter Seller Name",
                            controller: nameController,
                          ),
                          Text(
                            "Email ID",
                            style: fontstyle,
                          ),

                          SimpleInputBox(
                            controller: emailController,
                            hintText: "something@gmail.com",

                            textInputType: TextInputType.emailAddress,
                          ),
                          Text(
                            "Date of Birth",
                            style: fontstyle,
                          ),
                          SimpleInputBox(
                            controller: otpemailController,
                            hintText: "DD/MM/YYYY",
                            textInputType: TextInputType.number,

                          ),
                          Text(
                            "Phone Number",
                            style: fontstyle,
                          ),
                          SimpleInputBox(
                            controller: mobileNumberController,
                            hintText: "91XXXXXXXX",
                            textInputType: TextInputType.number,

                          ),


                          Text(
                            "Seller Document",
                            style: fontstyle,
                          ),
                          InputBox(
                            controller: idDocumentController,
                            hintText: "Upload Seller Document",
                            textInputType: TextInputType.none,
                            prefixIconn: Icons.image_outlined,
                            saffix: Container(
                              margin: EdgeInsets.all(1),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: ThemeColorYellow,
                                ),
                                onPressed: () {},
                                child: Text(
                                  "CHOOSE",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 10),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "Address Proof",
                            style: fontstyle,
                          ),
                          InputBox(
                            controller: cinController,
                            textInputType: TextInputType.none,
                            hintText: "Upload Address Proof",
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
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 10),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "Personal ID Proof",
                            style: fontstyle,
                          ),
                          InputBox(
                            textInputType: TextInputType.none,
                            controller: panController,
                            hintText: "Upload your ID Proof",
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
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 10),
                                ),
                              ),
                            ),
                          ),

                          Text(
                            "Personal Address",
                            style: fontstyle,
                          ),
                          TextFormField(
                            decoration: InputDecoration(

                                contentPadding: EdgeInsets.only(left: 15,bottom: 10),


                                hintText: "Enter Personal Address",



                                hintStyle: TextStyle(
                                  fontSize: 12,
                                ),

                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: ThemeColoricon)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: ThemeColorYellow))),
                            maxLines: 4,



                          ),

                          Text(
                            "Pin Code",
                            style: fontstyle,
                          ),
                          SimpleInputBox(
                            textInputType: TextInputType.none,
                            controller: tanController,
                            hintText: "XXX XXX",

                          ),
                          Text(
                            "Shop Address",
                            style: fontstyle,
                          ),
                          TextFormField(
                            decoration: InputDecoration(

                                contentPadding: EdgeInsets.only(left: 15,bottom: 10),


                                hintText: "Enter Shop Address",



                                hintStyle: TextStyle(
                                  fontSize: 12,
                                ),

                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: ThemeColoricon)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: ThemeColorYellow))),
                            maxLines: 4,



                          ),
                          Text(
                            "Pin Code of Shop",
                            style: fontstyle,
                          ),
                          SimpleInputBox(
                            textInputType: TextInputType.none,
                            controller: gstinController,
                            hintText: "XXX XXX",

                          ),

                          ButtonModal(
                            buttonText: "Save",
                          ),
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
