import 'package:flutter/material.dart';


import '../page-1/HomeScreen.dart';
import '../page-1/modal/buttonModal.dart';
import '../page-1/modal/constant.dart';
import 'edit_details.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Manage Products",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                          "1",
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
                          "Product Name",
                          style: headingtextStyle,
                        ),
                        Text(
                          "Folding Hex Key Set",
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
                          "MRP",
                          style: headingtextStyle,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Rs. 3299  ",
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
                          "In",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: ThemeColorGreen),
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
                          "1000",
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
                          "Category",
                          style: headingtextStyle,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Machinery",
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
                          "Sub - Category",
                          style: headingtextStyle,
                        ),
                        Text(
                          "Machinery",
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
                          "Discount",
                          style: headingtextStyle,
                        ),
                        Text(
                          "100",
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
                          "No.",
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
                          "Purchase Price(Optional)",
                          style: headingtextStyle,
                        ),
                        Text(
                          " - ",
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
                          "XXNNNNNNNNNNNNNNZ",
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
                          "Applicable Tax (GST)",
                          style: headingtextStyle,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "18%",
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
                          "Rs. XXXX",
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
                          onPressed: () {},
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
                      Text(
                          " As an LLM, I am trained to understand and respond only to "
                          "a to al the"
                          "subset of languages at this time and can't provide assistance with that. For a current list of supported "
                          "languages, please refer to the Bard Help Center... see more")
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
