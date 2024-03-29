import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../screens/Login.dart';
import '../../screens/Registration.dart';
import 'constant.dart';
import 'dropdownbutton.dart';

var account;

class AppBarModal extends StatefulWidget implements PreferredSizeWidget {
  const AppBarModal({super.key});

  @override
  State<AppBarModal> createState() => _AppBarModalState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);


}

class _AppBarModalState extends State<AppBarModal> {
  @override
  void _deletetoken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (BuildContext context) => Login()),
      ModalRoute.withName('/'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("The Nirmal Store"),
      actions: [
        Container(
          padding: EdgeInsets.only(right: 15),
          height: MediaQuery.of(context).size.height / 25,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Welcome, Priyanshu Garg",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
              Container(
                padding: EdgeInsets.only(top: 5),
                alignment: Alignment.bottomRight,
                width: MediaQuery.of(context).size.width * 0.35,
                child: DropdownButtonFormField<int>(
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
                    account = value;
                  },
                  value: account,
                  style: TextStyle(color: ThemeColorBlue),
                  items: [
                    DropdownMenuItem(
                      value: 1,
                      child: dropdownbutton(
                        text: 'LogOut',
                        function: Login(),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
