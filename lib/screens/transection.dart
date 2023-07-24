import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../page-1/modal/constant.dart';
import '../utils.dart';
import 'home.dart';

class Transection extends StatefulWidget {
  const Transection({super.key});

  @override
  State<Transection> createState() => _TransectionState();
}

class _TransectionState extends State<Transection> {
  var yeardropDownVlaue;
  var DurationdropdownValue;
  var belowDurationdropdownValue;
  List<String> yearList = [
    "2023",
    "2022",
    "2021",
    "2020",
    "2019",
    "2018",
    "2017",
  ];
  List<String> DurationList = [
    "Year",
    "Month",
    "Weak",
    "Date",

  ]; List<String> BelowDurationList = [
    "Year",
    "Month",
    "Weak",
    "Date",

  ];

  final List<ChartData> chartData = [
    ChartData(7.00, 2750),
    ChartData(8.00, 3443),
    ChartData(9.00, 2345),
    ChartData(10.00, 4137),
    ChartData(11.00, 3537),
    ChartData(12.00, 3937),
    ChartData(13.00, 1500),
    ChartData(14.00, 2345),
    ChartData(15.00, 3343),
    ChartData(16.00, 4891),
    ChartData(17.00, 2300),
    ChartData(18.00, 4232),
  ];

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;

    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    late FocusNode focusNode = FocusNode()
      ..addListener(() {
        setState(() {});
      });

    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        child: Container(
          // autogroupodsebaE (UPx9VuDVaT14MHF32KoDSE)
          padding:
              EdgeInsets.fromLTRB(6 * fem, 6 * fem, 6 * fem, 9 * fem),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  'Transaction Report',
                  style: SafeGoogleFont(
                    'Poppins',
                    fontSize: 18 * ffem,
                    fontWeight: FontWeight.w500,
                    height: 2 * ffem / fem,
                    letterSpacing: -0.4 * fem,
                    color: Color(0xff22272f),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      dropdown(context, yeardropDownVlaue, yearList),
                      Container(
                        // dashboardhtA (41:1958)

                        child: Text(
                          'Year Wise Data',
                          style: SafeGoogleFont(
                            'Poppins',
                            fontSize: 16 * ffem,
                            fontWeight: FontWeight.w500,
                            height: 2 * ffem / fem,
                            letterSpacing: -0.4 * fem,
                            color: Color(0xff22272f),
                          ),
                        ),
                      ),
                      dropdown(context, DurationdropdownValue, DurationList),
                    ]),
              ),
              Container(
                // statsQna (41:2003)
                margin: EdgeInsets.fromLTRB(
                    17 * fem, 0 * fem, 0 * fem, 5 * fem),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      // autogroupagss9VG (UPxAPTZvEVpccqNVU8aGSS)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 8 * fem),
                      width: 96 * fem,
                      height: 50 * fem,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Today's Sales"),
                          Row(
                            children: [
                              Text(
                                "Rs.",
                                style: TextStyle(
                                    color: ThemeColoricon,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "49,434",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      // past12hoursstatsNHU (41:2008)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 105 * fem, 0 * fem),
                      child: Text(
                        'Past 12 Hours Stats',
                        style: SafeGoogleFont(
                          'Poppins',
                          fontSize: 12 * ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.3333333333 * ffem / fem,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SfCartesianChart(

                backgroundColor:  Color.fromARGB(2, 243, 244, 246),
                plotAreaBackgroundColor:Color.fromARGB(2, 243, 244, 246),
                plotAreaBorderColor: ThemeColorDivider,


                primaryXAxis: CategoryAxis

                  (

                ),
                primaryYAxis: NumericAxis(

                  minimum: 1250,
                  maximum: 5300,


                ),


                series: <ChartSeries<ChartData, double>>[
                  ColumnSeries<ChartData, double>(
                      dataLabelSettings: DataLabelSettings(
                        labelPosition: ChartDataLabelPosition.outside,
                        alignment: ChartAlignment.center,
                        textStyle: TextStyle(
                          fontSize: 8,
                          color: Colors.black54,

                        ),
                        isVisible: true,


                      ),

                      pointColorMapper:(ChartData data,  _) => data.color,


                      dataSource: chartData,


                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y),
                ],
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10, right: 10, left: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        // dashboardhtA (41:1958)

                        child: Text(
                          'Year Wise Data',
                          style: SafeGoogleFont(
                            'Poppins',
                            fontSize: 18 * ffem,
                            fontWeight: FontWeight.w500,
                            height: 2 * ffem / fem,
                            letterSpacing: -0.4 * fem,
                            color: Color(0xff22272f),
                          ),
                        ),
                      ),
                      dropdown(context, belowDurationdropdownValue, BelowDurationList),
                    ]),
              ),
              Container(
                // metricsnf8 (41:1959)
                margin: EdgeInsets.fromLTRB(
                    21 * fem, 0 * fem, 27 * fem, 82 * fem),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // cardsvFY (41:1960)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 13 * fem),
                      width: double.infinity,
                      height: 61 * fem,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OrderWidget(
                            imageUrl: 'assets/page-1/images/icon-MeE.png',
                            title: 'Ordered Delivered',
                            number: '14/',
                            widget: Text(
                              "17",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                          OrderWidget(
                              imageUrl:
                                  'assets/page-1/images/icon-NNi.png',
                              title: 'Total Orders',
                              number: '17',
                              widget: Image.asset(
                                'assets/page-1/images/trendingup-vjG.png',
                                width: 9.79 * fem,
                                height: 7.25 * fem,
                              )),
                        ],
                      ),
                    ),
                    Container(
                      // cardsvFY (41:1960)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 13 * fem),
                      width: double.infinity,
                      height: 61 * fem,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OrderWidget(
                              imageUrl:
                                  'assets/page-1/images/icon-bA6.png',
                              title: 'Increase in Orders',
                              number: '4%',
                              widget: Image.asset(
                                'assets/page-1/images/trendingup-vjG.png',
                                width: 9.79 * fem,
                                height: 7.25 * fem,
                              )),
                          OrderWidget(
                              imageUrl:
                                  'assets/page-1/images/icon-NsY.png',
                              title: 'Product Views',
                              number: '12%',
                              widget: Image.asset(
                                'assets/page-1/images/trendingup-2r2.png',
                                width: 9.79 * fem,
                                height: 7.25 * fem,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container dropdown(BuildContext context, dropDownVlaue, itemList) {
    late FocusNode focusNode = FocusNode()
      ..addListener(() {
        setState(() {});
      });

    return Container(
      width: MediaQuery.of(context).size.width * .25,
      height: 53,
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
            labelStyle: headingtextStyle,
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: ThemeColoricon),
              borderRadius: const BorderRadius.all(
                const Radius.circular(5.0),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: ThemeColorYellow),
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
            )),
        focusNode: focusNode,
        icon: Icon(
          Icons.keyboard_arrow_down,
          color: focusNode.hasFocus ? ThemeColorYellow : ThemeColortext,
        ),
        hint: Text("Select"),
        elevation: 16,
        isExpanded: true,
        style: TextStyle(color: ThemeColortext),
        onChanged: (String? value) {
          dropDownVlaue = value!;
          // This is called when the user selects an item.
          setState(() {
            dropDownVlaue;
          });
        },
        value: dropDownVlaue,
        items: itemList.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: productTextStyle,
            ),
          );
        }).toList(),
      ),
    );
  }
}
