import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nirmal_store/screens/transection.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../page-1/modal/Appbar.dart';
import '../page-1/modal/constant.dart';
import '../page-1/modal/dropdownbutton.dart';
import '../screens/Login.dart';
import '../screens/Orders.dart';
import '../screens/EditProfile.dart';
import '../screens/Profile.dart';
import '../screens/home.dart';
import '../screens/products.dart';
import '../screens/refer_earn.dart';


class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  var _key;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List _widgetOptions = [
    Home(),
    Products(),
    Orders(),
    Refer_Earn(),
    Transection(),
    Profile()
  ];

  var account;



  @override
  Widget build(BuildContext context) {
    List<Widget> Account = [];
    return Scaffold(
      appBar:AppBarModal(),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: ThemeColorGrey,
        selectedItemColor: Colors.black,
        selectedIconTheme: IconThemeData(),
        selectedFontSize: 8,
        selectedLabelStyle: TextStyle(shadows: [
          Shadow(
              color: Colors.grey.shade800,
              blurRadius: 1.5,
              offset: Offset.infinite)
        ]),
        elevation: 16,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Image(
                image: AssetImage('assets/page-1/images/dashboard.png'),
                width: 30,
                height: 20,
              ),
              activeIcon: SvgPicture.asset(
                'assets/page-1/svgImages/grid_view.svg',
                semanticsLabel: 'a',
                height: 30,
                width: 30,
              ),
              label: '',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/page-1/images/gift.png',
              height: 25,
            ),
            activeIcon: SvgPicture.asset(
              'assets/page-1/svgImages/gift.svg',
              semanticsLabel: 'a',
              height: 30,
              width: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/page-1/images/empty.svg',
              semanticsLabel: 'My  Image',
              height: 30,
              width: 30,
            ),
            activeIcon: SvgPicture.asset(
              'assets/page-1/svgImages/upcomingg.svg',
              semanticsLabel: '1',
              height: 30,
              width: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image(
              image: AssetImage('assets/page-1/images/quality_8990627.png'),
              width: 30,
              height: 30,
              color: ThemeColorbothomIcon,
            ),
            activeIcon: SvgPicture.asset(
              'assets/page-1/svgImages/award.svg',
              semanticsLabel: 'a',
              height: 30,
              width: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/page-1/svgImages/shared.svg',
              semanticsLabel: 'a',
              height: 30,
              width: 30,
            ),
            activeIcon: SvgPicture.asset(
              'assets/page-1/svgImages/folder_shared.svg',
              semanticsLabel: 'a',
              height: 30,
              width: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/page-1/images/user_icon.png',
              height: 30,
              color: ThemeColorbothomIcon,
            ),
            label: '',
            activeIcon: SvgPicture.asset(
              'assets/page-1/svgImages/user.svg',
              semanticsLabel: 'a',
              height: 30,
              width: 30,
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

// class Appbar extends StatefulWidget {
//   const Appbar({super.key});
//
//   @override
//   State<Appbar> createState() => _AppbarState();
// }

// class _AppbarState extends State<Appbar> {
//   @override
//   var _key;
//   Widget build(BuildContext context) {
//     void _deletetoken() async {
//       print('running');
//       final prefs = await SharedPreferences.getInstance();
//       final key = prefs.remove('token');
//       setState(() {
//         _key = key;
//       });
//       print('YOUR KEY - "$key"');
//       print('key deleted');
//     }
//     return AppBar(
//       title: Text("The Nirmal Store"),
//       actions: [
//         Container(
//           padding: EdgeInsets.only(right: 15),
//           height: MediaQuery.of(context).size.height / 25,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Text(
//                 "Welcome, Priyanshu Garg",
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
//               ),
//               Container(
//                 padding: EdgeInsets.only(top: 5),
//                 alignment: Alignment.bottomRight,
//                 width: MediaQuery.of(context).size.width * 0.35,
//                 child: DropdownButtonFormField<int>(
//                     decoration: InputDecoration(
//                       labelText: "Account",
//                       isCollapsed: true,
//                       border: InputBorder.none,
//                       labelStyle:
//                       TextStyle(color: ThemeColorYellow, fontSize: 18),
//                       filled: true,
//                     ),
//                     hint: Text(''),
//                     icon: Icon(Icons.arrow_drop_down_outlined),
//                     iconDisabledColor: ThemeColorYellow,
//                     iconEnabledColor: ThemeColorYellow,
//                     elevation: 0,
//                     onChanged: (value) {
//                       account = value!;
//                       // This is called when the user selects an item.
//                       // setState(() {
//                       //   account;
//                       // });
//                     },
//                     value: account,
//                     style: TextStyle(color: ThemeColorBlue),
//                     items: [
//                       DropdownMenuItem(
//                         value: 1,
//                         child: dropdownbutton(
//                           text: 'LogOut',
//                           function:  showDialog(
//                             context: context,
//                             builder: (context) => AlertDialog(
//                               title: new Text('Are you sure?'),
//                               content: new Text('Do you want to Logout'),
//                               actions: <Widget>[
//                                 TextButton(
//                                   onPressed: () =>
//                                       Navigator.of(context).pop(false), //<-- SEE HERE
//                                   child: new Text('No'),
//                                 ),
//                                 TextButton(
//                                   onPressed: () {
//                                     _deletetoken();
//                                     Navigator.pushAndRemoveUntil(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: (BuildContext context) =>
//                                                Login()),
//                                         ModalRoute.withName('/'));
//                                   }, // <-- SEE HERE
//                                   child: new Text('Yes'),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ]),
//               )
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }




