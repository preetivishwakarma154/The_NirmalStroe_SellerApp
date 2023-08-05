import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nirmal_store/screens/AddProfile.dart';
import 'package:nirmal_store/screens/SplashScreen.dart';
import 'package:nirmal_store/screens/edit.dart';
import 'package:nirmal_store/screens/edit_details.dart';
import 'package:http/http.dart' as http;
import '../page-1/modal/constant.dart';
import 'EditProfile.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Map getProfileData = Map();

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

      if (response.statusCode == 200) {
        setState(() {
          getProfileData = jsonDecode(data);
        });
        if (getProfileData['status'] == 1) {
          print(getProfileData);
          print(getProfileData['data']['profile_pic']);

        }
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: getProfileData.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>EditProfileDetails(),
                                  ));
                            },
                            child: Text(
                              'Edit Details',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: ThemeColorImageText,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.15,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ThemeColorYellow,
                            image: DecorationImage(
                              image:
                                  AssetImage('assets/page-1/images/person.png'),
                            )),
                      ),

                      ListTile(
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -2),
                        title: Text(
                          'Full Name',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          getProfileData['data']['seller_name']==null?'':getProfileData['data']['seller_name'],
                          style: TextStyle(height: 2),
                        ),
                      ),
                      ListTile(
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -2),
                        title: Text(
                          'Email ID',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          getProfileData['data']['email'] == null
                              ? ''
                              : getProfileData['data']['email'],
                          style: TextStyle(height: 2),
                        ),
                      ),
                      ListTile(
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -2),
                        title: Text(
                          'Date of Birth',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          getProfileData['data']['dob'] == null
                              ? ''
                              : getProfileData['data']['dob'],
                          style: TextStyle(height: 2),
                        ),
                      ),
                      ListTile(
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -2),
                        title: Text(
                          'Phone Number',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          getProfileData['data']['mobile_no'] == null
                              ? ''
                              : getProfileData['data']['mobile_no'],
                          style: TextStyle(height: 2),
                        ),
                      ),
                      SelectDocument(
                        title: 'Seller Document',
                      ),
                      SelectDocument(
                        title: 'Address Proof',
                      ),
                      SelectDocument(
                        title: getProfileData['data']['address_proof'] == null
                            ? ''
                            : getProfileData['data']['address_proof'],
                      ),
                      ListTile(
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: 1),
                        title: Text(
                          'Personal Address',
                          style:
                              TextStyle(fontWeight: FontWeight.w400, height: 2),
                        ),
                        subtitle: Text(
                          getProfileData['data']['address'] == null
                              ? ''
                              : getProfileData['data']['address'],
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              height: 1.2),
                        ),
                      )
                    ],
                  ),
                ),
              ));
  }
}

class SelectDocument extends StatelessWidget {
  const SelectDocument({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15, left: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              flex: 1,
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              )),
          Expanded(
            flex: 2,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 12, top: 8, bottom: 8, right: 60),
              child: InkWell(
                onTap: () {},
                child: Text(
                  "View Document",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: ThemeColorImageText),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
