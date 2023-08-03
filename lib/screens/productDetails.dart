import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nirmal_store/screens/SplashScreen.dart';
import '../page-1/modal/Appbar.dart';
import '../page-1/modal/buttonModal.dart';
import '../page-1/modal/constant.dart';
import 'HomeScreen.dart';
import 'edit_details.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key, required this.id}) : super(key: key);
  final String id;
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

Map SingleProductData = Map();

class _ProductDetailsState extends State<ProductDetails> {
  var stock;

  Future SingleProductId(id) async {
    var headers = {
      'x-access-token': '$globalusertoken',
      'Cookie': 'ci_session=b51b8b040483a72d6aa2762b88719c35bb9f2651'
    };
    var request = http.MultipartRequest('POST',
        Uri.parse('http://thenirmanstore.com//v1/seller/single_product'));
    request.fields.addAll({'product_id': id});

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var data = await response.stream.bytesToString();
    setState(() {
      SingleProductData = jsonDecode(data);
    });

    if (response.statusCode == 200) {
      if (SingleProductData['status'] == 1) {

        setState(() {
          var stockdata = double.parse(SingleProductData['data']['price']);
          if (stockdata == null) {
            stock = '';
          } else if (stockdata > 0.0) {
            stock = 'In';
          } else {
            stock = 'Out';
          }
        });
      }
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  void initState() {
    SingleProductId(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarModal(),
      body: SingleProductData.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Manage Products",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(),
                      height: 80,
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.all(10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("ID", style: headingtextStyle),
                              Text(
                                SingleProductData['data']['product_id'] == null
                                    ? ''
                                    : SingleProductData['data']['product_id'],
                                style: productTextStyle,
                              ),
                            ],
                          ),
                          VerticalDivider(
                            color: ThemeColorDivider,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Product Name",
                                  style: headingtextStyle,
                                ),
                                Text(
                                  SingleProductData['data']['product_name'] ==
                                          null
                                      ? ''
                                      : SingleProductData['data']
                                          ['product_name'],
                                  style: productTextStyle,
                                ),
                              ],
                            ),
                          ),
                          VerticalDivider(
                            color: ThemeColorDivider,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "MRP",
                                style: headingtextStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                SingleProductData['data']['price'] == null
                                    ? ''
                                    : SingleProductData['data']['price'],
                                style: productTextStyle,
                              ),
                            ],
                          ),
                          VerticalDivider(
                            color: ThemeColorDivider,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Stock",
                                style: headingtextStyle,
                              ),
                              Text(
                                stock == null ? '' : stock,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: stock == 'In'
                                        ? ThemeColorGreen
                                        : ThemeColorRed),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(),
                      height: 80,
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.all(10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Quantity in Stock",
                                style: headingtextStyle,
                              ),
                              Text(
                                SingleProductData['data']['quantity'] == null
                                    ? ''
                                    : SingleProductData['data']['quantity'],
                                style: productTextStyle,
                              ),
                            ],
                          ),
                          VerticalDivider(
                            color: ThemeColorDivider,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Category",
                                  style: headingtextStyle,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  SingleProductData['data']['category_name'] == null
                                      ? ''
                                      : SingleProductData['data']['category_name']  ,                              style: productTextStyle,
                                ),
                              ],
                            ),
                          ),
                          VerticalDivider(
                            color: ThemeColorDivider,
                          ),
                          Expanded(child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Sub - Category",
                                style: headingtextStyle,
                              ),
                              Text(
                                SingleProductData['data']['sub_category_name'] == null
                                    ? ''
                                    : SingleProductData['data']['sub_category_name'] ,                                style: productTextStyle,
                              )
                            ],
                          ) )

                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(),
                      height: 80,
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.all(10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Discount",
                                style: headingtextStyle,
                              ),
                              Text(
                                SingleProductData['data']['discount_percent'] ==
                                        null
                                    ? ''
                                    : SingleProductData['data']
                                        ['discount_percent'],
                                style: productTextStyle,
                              ),
                            ],
                          ),
                          VerticalDivider(
                            color: ThemeColorDivider,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Unit",
                                style: headingtextStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                SingleProductData['data']['unit'] == null
                                    ? ''
                                    : SingleProductData['data']['unit'] ,                                 style: productTextStyle,
                              ),
                            ],
                          ),
                          VerticalDivider(
                            color: ThemeColorDivider,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Purchase Price(Optional)",
                                style: headingtextStyle,
                              ),
                              Text(
                                SingleProductData['data']['purchase_price'] ==
                                        null
                                    ? ''
                                    : SingleProductData['data']
                                        ['purchase_price'],
                                style: productTextStyle,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(),
                      height: 80,
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.all(10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "GSTIN (HSN/SAC Code)",
                                style: headingtextStyle,
                              ),
                              Text(
                                SingleProductData['data']['hsn_code'] ==
                                    null
                                    ? ''
                                    : SingleProductData['data']
                                ['hsn_code'],
                                style: productTextStyle,
                              ),
                            ],
                          ),
                          VerticalDivider(
                            color: ThemeColorDivider,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Applicable Tax(GST)",
                                style: headingtextStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                SingleProductData['data']['applicable_tax'] ==
                                        null
                                    ? ''
                                    : SingleProductData['data']
                                        ['applicable_tax'],
                                style: productTextStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(),
                      height: 85,
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.all(10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Price for Seller", style: headingtextStyle),
                              Text(
                                SingleProductData['data']['price_for_seller'] ==
                                        null
                                    ? ''
                                    : SingleProductData['data']
                                        ['price_for_seller'],
                                style: productTextStyle,
                              ),
                            ],
                          ),
                          VerticalDivider(
                            color: ThemeColorDivider,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Product Image",
                                style: headingtextStyle,
                              ),
                              TextButton(
                                onPressed: () {
                                  showDialog<void>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Container(
                                        child: SingleProductData['data']
                                                        ['product_img'][0]
                                                    ['catalog_image'] ==null

                                            ? Text('Image not found')
                                            : Image(
                                                image: NetworkImage('http://thenirmanstore.com//images/product/'+
                                                    SingleProductData['data']
                                                            ['product_img'][0]
                                                        ['catalog_image'])),
                                      );
                                    },
                                  );
                                },
                                child: Text(
                                  "View Image",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: ThemeColorBlueLink),
                                ),
                              )
                            ],
                          ),
                          VerticalDivider(
                            color: ThemeColorDivider,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Product Video",
                                style: headingtextStyle,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Play video",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: ThemeColorBlueLink),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(top: 20, bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Product Description",
                              style: headingtextStyle,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  SingleProductData['data']
                                              ['short_description'] ==
                                          null
                                      ? ''
                                      : SingleProductData['data']
                                          ['short_description'],
                                ),
                                TextButton(
                                  style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      minimumSize: Size(50, 30),
                                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      alignment: Alignment.centerLeft),
                                  onPressed: () {
                                    showDialog(context: context, builder: (context) {
                                      return SimpleDialog(
                                         title: Container(
                                           margin: EdgeInsets.all(40),
                                           color: Colors.white,
                                           child: Text(SingleProductData['data']
                                        ['long_description'] ==
                                            null
                                            ? 'Description not found'
                                            : SingleProductData['data']
                                        ['long_description'],),),
                                      );
                                    },);
                                  },
                                  child: Text(
                                    'see more...',
                                    style: TextStyle(
                                      color: ThemeColorBlue,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        )),
                    ButtonModal(
                      buttonText: "EDIT DETAILS",
                      function: EditDetails(),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
