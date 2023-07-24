import 'package:flutter/material.dart';

import '../../screens/Login.dart';
import '../../screens/Registration.dart';
import 'constant.dart';
var account;
class AppBarModal extends StatefulWidget {
  const AppBarModal({Key? key, required this.text, required this.body}) : super(key: key);

  final Text text;
  final Widget body;


  @override
  State<AppBarModal> createState() => _AppBarModalState();
}

class _AppBarModalState extends State<AppBarModal> {


  @override
  Widget build(BuildContext context) {
    return




      Scaffold(

      appBar: AppBar(
        title: widget.text,
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
                  width: MediaQuery.of(context).size.width * 0.29,
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
                      onChanged: ( value) {
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
                          value:1,
                          child:   InkWell(
                              onTap: () {
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (context) => Login()));
                              },
                              child: Text("Login")),),
                        DropdownMenuItem(
                          value: 2,
                          child:  InkWell(
                              onTap: () {
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (context) => Registration()));
                              },
                              child: Text("Registraion")),)
                      ]
                  ),
                )
              ],
            ),
          )
        ],
      ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: widget.body,
        ),
    );
  }
}
