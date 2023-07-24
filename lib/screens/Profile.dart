import 'package:flutter/material.dart';
import 'package:nirmal_store/screens/edit_details.dart';

import '../page-1/modal/constant.dart';
import 'EditDetails.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfileDetails(),));
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
                height: MediaQuery.of(context).size.height*0.15,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ThemeColorYellow,

                  image: DecorationImage(
                    image: AssetImage('assets/page-1/images/person.png'),

                  )
                ),

              ),TextButton(
                onPressed: () {},
                child: Text(
                  'Change Profile Photo',
                  style: TextStyle(
                      fontSize: 14,
                      color: ThemeColorImageText,
                      fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                visualDensity: VisualDensity(horizontal: 0, vertical: -2),
                title: Text('Full Name',style: TextStyle(fontWeight: FontWeight.w500),),
                subtitle: Text("Priyanshu Garg",
                style: TextStyle(
                  height: 2
                ),),
              ),ListTile(
                visualDensity: VisualDensity(horizontal: 0, vertical: -2),
                title: Text('Email ID',style: TextStyle(fontWeight: FontWeight.w500),),
                subtitle: Text("priyanshugarg@gmail.com",
                style: TextStyle(
                  height: 2
                ),),
              ),ListTile(
                visualDensity: VisualDensity(horizontal: 0, vertical: -2),
                title: Text('Date of Birth',style: TextStyle(fontWeight: FontWeight.w500),),
                subtitle: Text("23/07/2000",
                style: TextStyle(
                  height: 2
                ),),
              ),ListTile(
                visualDensity: VisualDensity(horizontal: 0, vertical: -2),
                title: Text('Phone Number',style: TextStyle(fontWeight: FontWeight.w500),),
                subtitle: Text("91XXXXXXXX",
                style: TextStyle(
                  height: 2
                ),),
              ),
              SelectDocument(title: 'Seller Document', ),
              SelectDocument(title: 'Address Proof', ),
              SelectDocument(title: 'ID Proof', ),
              ListTile(
                visualDensity: VisualDensity(horizontal: 0, vertical: 1),

                title: Text('Personal Address',style: TextStyle(fontWeight: FontWeight.w400,height: 2),),
                subtitle: Text("2004/C, Scheme No, Vijay Nagar, Jabalpur, Madhya Pradesh 482002",
                  style: TextStyle(
                    color: Colors.black,
                      fontWeight: FontWeight.bold,
                    height: 1.2
                  ),),
              )




            ],
          ),
        ),
      )
    );
  }
}

class SelectDocument extends StatelessWidget {
  const SelectDocument({
    super.key, required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15,left: 15),



      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Expanded(
              flex: 1,
              child: Text(title,style:  TextStyle(color: Colors.black, fontSize: 14,fontWeight: FontWeight.w500),)),
          Expanded(
              flex: 2,
              child:Padding(
                padding: const EdgeInsets.only(left: 12,top: 8,bottom: 8,right: 60),
                child: InkWell(
                  onTap: (){

                  },

                  child: Text("View Document",style: TextStyle(
                    fontSize: 14,fontWeight: FontWeight.bold,
                    color: ThemeColorImageText
                  ),),
                ),
              ),),




        ],
      ),
    );




  }
}
