import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';

import 'package:nirmal_store/screens/SplashScreen.dart';
import 'package:nirmal_store/utils.dart';

// import 'package:myapp/page-1/month-wise.dart';
// import 'package:myapp/page-1/week-wise.dart';
// import 'package:myapp/page-1/dates.dart';
// import 'package:myapp/page-1/seller-dashboard-manage-orders-3.dart';
// import 'package:myapp/page-1/seller-dashboard-manage-orders-settlement.dart';
// import 'package:myapp/page-1/seller-dashboard-manage-orders.dart';
// import 'package:myapp/page-1/seller-dashboard-add-products-2.dart';
// import 'package:myapp/page-1/seller-dashboard-add-products.dart';
// import 'package:myapp/page-1/profile.dart';
// import 'package:myapp/page-1/profile-Bka.dart';
// import 'package:myapp/page-1/profile-6wg.dart';
// import 'package:myapp/page-1/profile-1Qi.dart';
// import 'package:myapp/page-1/seller-dashboard-manage-products.dart';
// import 'package:myapp/page-1/seller-dashboard-1.dart';
// import 'package:myapp/page-1/seller-dashboard-2.dart';
// import 'package:myapp/page-1/seller-login-2.dart';
// import 'package:myapp/page-1/seller-login-1.dart';
// import 'package:myapp/page-1/seller-registration-3.dart';
// import 'package:myapp/page-1/seller-registration-2.dart';
// import 'package:myapp/page-1/seller-registration-1.dart';
// import 'package:myapp/page-1/ipad-pro-129-1.dart';
// import 'package:myapp/page-1/iphone-14-2.dart';
// import 'package:myapp/page-1/iphone-14-7.dart';
// import 'package:myapp/page-1/iphone-14-4.dart';
// import 'package:myapp/page-1/iphone-14-8.dart';
// import 'package:myapp/page-1/iphone-14-5.dart';
// import 'package:myapp/page-1/iphone-14-9.dart';
// import 'package:myapp/page-1/iphone-14-6.dart';
// import 'package:myapp/page-1/iphone-14-3.dart';
// import 'package:myapp/page-1/iphone-14-10.dart';
// import 'package:myapp/page-1/iphone-14-1.dart';
// import 'package:myapp/page-1/iphone-14-11.dart';
// import 'package:myapp/page-1/id-proof.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {

		 Map<int, Color> color = {
			50: Colors.blue.shade50,
			100: Colors.blue.shade100,
			200: Colors.blue.shade200,
			300: Colors.blue.shade300,
			400: Colors.blue.shade400,
			500: Colors.blue.shade500,
			600: Colors.blue.shade600,
			700: Colors.blue.shade700,
			800: Colors.blue.shade800,
			900: Colors.blue.shade900,
		};

		 MaterialColor primeColor = MaterialColor(0xFF2453a9, color);
		 MaterialColor accentColor = MaterialColor(0xFFffd203, color);
	return MaterialApp(
		title: 'Flutter',
		debugShowCheckedModeBanner: false,
		scrollBehavior: MyCustomScrollBehavior(),
		theme: ThemeData(
		primarySwatch: primeColor
		),
		home: SplashScreen(),
	);
	}
}
