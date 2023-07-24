import 'package:flutter/material.dart';
import 'package:nirmal_store/page-1/HomeScreen.dart';
import 'package:nirmal_store/page-1/modal/constant.dart';

class EditProfileDetails extends StatefulWidget {
  const EditProfileDetails({super.key});

  @override
  State<EditProfileDetails> createState() => _EditProfileDetailsState();
}

class _EditProfileDetailsState extends State<EditProfileDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Column(
            children: [
              EditProfileBox(
                title: "Full Name",
                subtitle: "Priyanshu Garg",
                buttonText: "Change Name",
              ),
              EditProfileBox(
                title: "Email ID",
                subtitle: "priyanshugarg@gmail.com",
                buttonText: "Change Email",
              ),
              EditProfileBox(
                title: "Date of Birth",
                subtitle: "23/07/2000",
                buttonText: "Change DOB",
              ),
              EditProfileBox(
                title: "Phone Number",
                subtitle: "91XXXXXXXX",
                buttonText: 'Change Number',
              ),
              SelectDocument(
                title: 'Seller Document',
              ),
              SelectDocument(
                title: 'Address Proof',
              ),
              SelectDocument(
                title: 'ID Proof',
              ),
              AddressBox(
                title: "Personal Address",
                address:
                    '2004/C, Scheme No 14, Vijay Nager, Jabalpur, Madhya Pradesh 482001',
              ),
              AddressBox(
                title: "Shop Address",
                address:
                    '2004/C, Scheme No 14, Vijay Nager, Jabalpur, Madhya Pradesh 482001',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddressBox extends StatelessWidget {
  const AddressBox({
    super.key,
    required this.title,
    required this.address,
  });
  final String title, address;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5, top: 10),
            child: Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Colors.black,
                  height: 2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Text(
                    address,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        height: 1.5),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    onTap: () {},
                    child: Text(
                      "Change Document",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: ThemeColorYellow),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class EditProfileBox extends StatelessWidget {
  const EditProfileBox({
    super.key,
    required this.title,
    required this.subtitle,
    required this.buttonText,
  });
  final String title, subtitle, buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 9),
                child: Text(
                  title,
                  style: productTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                  subtitle,
                  style: headingtextStyle,
                ),
              ),
            ],
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                buttonText,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: ThemeColorYellow),
              )),
        ],
      ),
    );
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
      margin: EdgeInsets.only(right: 8, left: 8, top: 10, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              flex: 2,
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              )),
          Expanded(
            flex: 2,
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
          Expanded(
            flex: 2,
            child: InkWell(
              onTap: () {},
              child: Text(
                "Change Document",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: ThemeColorYellow),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
