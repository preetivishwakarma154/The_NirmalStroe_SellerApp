import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nirmal_store/screens/SplashScreen.dart';

import '../page-1/modal/constant.dart';
import '../page-1/modal/product.dart';
import 'AddProduct.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

var ProductData;

class _ProductsState extends State<Products> {
  Future ProductAPI() async {
    try {
      var headers = {
        'x-access-token': '$globalusertoken',
        'Cookie': 'ci_session=58e0c5af88af028fdc2a797a47524b37df61260f'
      };
      var request = http.MultipartRequest(
          'GET', Uri.parse('http://thenirmanstore.com/v1/seller/product_list'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var data = await response.stream.bytesToString();
      setState(() {
        ProductData = jsonDecode(data);
      });

      if (response.statusCode == 200) {
        print(ProductData);
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    ProductAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductData == null
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                          itemCount: ProductData['data'].length,
                          itemBuilder: (context, index) => product(
                            productid: ProductData['data'][index]['product_id'] ==
                                      null
                                  ? ''
                                  : ProductData['data'][index]['product_id'],
                              productName: ProductData['data'][index]
                                          ['product_name'] ==
                                      null
                                  ? ''
                                  : ProductData['data'][index]['product_name'],
                              mrp: ProductData['data'][index]['price'] == null
                                  ? ''
                                  : ProductData['data'][index]['price'], id: ProductData['data'][index]['id'],)),
                    ),
                  ],
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ThemeColorYellow,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddProduct(),
              ));
        },
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
