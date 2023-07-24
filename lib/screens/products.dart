import 'package:flutter/material.dart';


import '../page-1/modal/constant.dart';
import '../page-1/modal/product.dart';
import 'AddProduct.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Manage Products",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              product(id: '1', productName: "Folding Hex Key Set", mrp: '3299',),
              product(id: '2', productName: "Circular Saw ", mrp: '1299',) ,
              product(id: '3', productName: "Rental Service", mrp: '2299',) ,
              product(id: '4', productName: "Tap Measure", mrp: '1299',) ,
              product(id: '5', productName: "Folding Hex Key Set", mrp: '3299',),
              product(id: '6', productName: "Circular Saw ", mrp: '1299',) ,
              product(id: '7', productName: "Rental Service", mrp: '2299',) ,
              product(id: '8', productName: "Tap Measure", mrp: '1299',) ,
       
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ThemeColorYellow,


        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct(),));

        },
        child: Icon(Icons.add,color: Colors.black,),
      ),
    );
    
  }
}


