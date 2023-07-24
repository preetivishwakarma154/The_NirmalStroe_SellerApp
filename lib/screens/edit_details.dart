import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../page-1/HomeScreen.dart';
import '../page-1/modal/EditText.dart';
import '../page-1/modal/buttonModal.dart';
import '../page-1/modal/constant.dart';

class EditDetails extends StatefulWidget {
  const EditDetails({Key? key}) : super(key: key);

  @override
  State<EditDetails> createState() => _EditDetailsState();
}

class _EditDetailsState extends State<EditDetails> {
  TextEditingController productNameController = TextEditingController();
  TextEditingController mrpController = TextEditingController();
  TextEditingController quatityController = TextEditingController();
  TextEditingController purchaseController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  TextEditingController gstinController = TextEditingController();
  TextEditingController sellerPriceController = TextEditingController();
  TextEditingController taxController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  var _image;
  final picker = ImagePicker();
  late FocusNode focusNode = FocusNode()
    ..addListener(() {
      setState(() {});
    });

  List<String> categoryList = [
    "Machinery",
    "Construction Material",
    "Equipments"
  ];
  List<String> unitList = [
    "Yes",
    "No",

  ];
  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  var dropdownvalue;

  var categoryValue;

  var unitValue;
  @override
  void initState() {
    productNameController.text = "Folding Hex Key Set";
    mrpController.text = "3299";
    quatityController.text = "1000";
    discountController.text = '100';
    gstinController.text = 'XXNNNNNNNNNNNZ';
    purchaseController.text= '-';
    taxController.text = '18';
    sellerPriceController.text= 'xxxx';
    descriptionController.text = " As an LLM, I am trained to understand and respond only to "
        "a to al the"
        "subset of languages at this time and can't provide assistance with that. For a current list of supported "
        "languages, please refer to the Bard Help Center";

    super.initState();
  }

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
                "Edit Manage Products",
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
                    editText(
                      textInputType: TextInputType.text,
                      inputBoxWidth: 0.30,
                      width: 0.32,
                      productNameController: productNameController,
                      heading: "Product Name",
                    ),
                    VerticalDivider(
                      color: ThemeColorDivider,
                    ),
                    editText(
                      textInputType: TextInputType.number,
                      inputBoxWidth: 0.25,
                      width: 0.15,
                      productNameController: mrpController,
                      heading: "MRP",
                    ),
                    VerticalDivider(
                      color: ThemeColorDivider,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.19,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 53,
                            child: DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  labelText: "Stock",
                                  labelStyle: headingtextStyle,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: ThemeColorYellow)),
                                  border: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: ThemeColoricon)),
                                  hintStyle: TextStyle(color: Colors.grey[800]),
                                ),
                                isExpanded: true,
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: focusNode.hasFocus
                                      ? ThemeColorYellow
                                      : ThemeColortext,
                                ),
                                hint: Text(
                                  "Select",
                                  style: TextStyle(fontSize: 10),
                                ),
                                elevation: 16,
                                style: TextStyle(
                                    color: ThemeColorBlue, fontSize: 12),
                                onChanged: (String? value) {
                                  dropdownvalue = value!;
                                  // This is called when the user selects an item.
                                  setState(() {
                                    dropdownvalue;
                                  });
                                },
                                value: dropdownvalue,
                                items: [
                                  DropdownMenuItem(
                                    value: '1',
                                    child: Text(
                                      "In",
                                      style: TextStyle(
                                          color: ThemeColorGreen,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: "2",
                                    child: Text(
                                      "Out",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  )
                                ]),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(),
                height: 80,
                margin: EdgeInsets.only(top: 10),
                padding:
                EdgeInsets.only( top: 10, bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    editText(
                      textInputType: TextInputType.number,
                      inputBoxWidth: 0.20,
                      width: 0.25,
                      productNameController: quatityController,
                      heading: "Quantity in Stock",
                    ),
                    VerticalDivider(
                      color: ThemeColorDivider,
                    ),
                    dropdown(context, "Category", categoryValue, categoryList),
                    VerticalDivider(
                      color: ThemeColorDivider,
                    ),
                    dropdown(context, "Category", categoryValue, categoryList),
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
                    editText(
                      textInputType: TextInputType.number,
                      inputBoxWidth: 0.20,
                      width: 0.2,
                      productNameController: discountController,
                      heading: "Discount",
                    ),
                    VerticalDivider(
                      color: ThemeColorDivider,
                    ),
                    dropdown(context, "Unit", unitValue, unitList),
                    VerticalDivider(
                      color: ThemeColorDivider,
                    ),
                    editText(
                      textInputType: TextInputType.number,
                      inputBoxWidth: 0.20,
                      width: 0.25,
                      productNameController: purchaseController,
                      heading: "Purchase Price (Optional)",
                    ),
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
                    editText(
                      textInputType: TextInputType.text,
                      inputBoxWidth: 0.55,
                      width: 0.4,
                      productNameController: gstinController,
                      heading: "GSTIN (HSN/SAC Code)",
                    ),

                    VerticalDivider(
                      color: ThemeColorDivider,
                    ),
                    editText(
                      textInputType: TextInputType.number,
                      inputBoxWidth: 0.45,
                      width: 0.35,
                      productNameController: taxController,
                      heading: "Applicable Tax (GST)",
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
                    editText(
                      textInputType: TextInputType.number,
                      inputBoxWidth: 0.3,
                      width: 0.25,
                      productNameController: sellerPriceController,
                      heading: "Price for Seller",
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
                            showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return SafeArea(
                                    child: Container(
                                      child: Wrap(
                                        children: [
                                          ListTile(
                                            leading: Icon(Icons.photo_library),
                                            title: Text('Gallery'),
                                            onTap: () {
                                              _getImage(ImageSource.gallery);
                                              Navigator.pop(context);
                                            },
                                          ),
                                          ListTile(
                                            leading: Icon(Icons.camera_alt),
                                            title: Text('Camera'),
                                            onTap: () {
                                              _getImage(ImageSource.camera);
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
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
                            "Change video",
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
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 1, right: 1),
                          child: TextFormField(
                            maxLines: 10,
                            controller: descriptionController,
                            decoration: InputDecoration(
                                contentPadding:
                                EdgeInsets.symmetric(vertical: 5.0, horizontal: 5),

                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide:
                                    BorderSide(color: ThemeColorDivider, width: 1)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                      color: ThemeColorYellow,
                                      width: 1,
                                    ))),
                            style: TextStyle(fontSize: 12.0),
                          ),
                        ),
                      )

                    ],
                  )),
              ButtonModal(
                buttonText: "SAVE DETAILS",
                function: EditDetails(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container dropdown(BuildContext context, label, dropDownVlaue, itemList) {
    return Container(
      width: MediaQuery.of(context).size.width * .28,
      height: 50,
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
            labelText: label,
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
            child: Text(value,style: productTextStyle,),
          );
        }).toList(),
      ),
    );
  }
}


