import 'package:flutter/material.dart';

import 'constant.dart';
class DropDownValue extends StatefulWidget {
 DropDownValue({Key? key, this.label, required this.itemList}) : super(key: key);
  final label;

      List<String> itemList;
  @override
  State<DropDownValue> createState() => _DropDownValueState();
}

class _DropDownValueState extends State<DropDownValue> {

  late FocusNode focusNode = FocusNode()
    ..addListener(() {
      setState(() {});
    });

  var dropDownVlaue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .28,
      height: 50,
      child: DropdownButtonFormField(
        value: dropDownVlaue,
        autofocus: true,
        items:widget.itemList.map<
            DropdownMenuItem
                >((String value) {
          return DropdownMenuItem
              (
              value: value,
              child: Text(value

               ));
        }).toList(),


        // onChanged:
        //     (SelectListItem? selectedInvestor) {
        //   if (selectedInvestor != null &&
        //       selectedInvestor.key! > 0) {
        //     _saveInvestorId(
        //         selectedInvestor.key!);
        //   } else {
        //     _removeInvestorId();
        //   }
        // },
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding:
            EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 10.0),
          ),
          onChanged: ( value) {
           dropDownVlaue = value!;
            // This is called when the user selects an item.
            setState(() {
             dropDownVlaue;
            });
          },
      ),
      );
      // DropdownButtonFormField<String>(
      //   decoration: InputDecoration(
      //       labelText: widget.label,
      //       labelStyle: headingtextStyle,
      //       border: OutlineInputBorder(
      //         borderSide: BorderSide(width: 1, color: ThemeColoricon),
      //         borderRadius: const BorderRadius.all(
      //           const Radius.circular(5.0),
      //         ),
      //       ),
      //       focusedBorder: OutlineInputBorder(
      //         borderSide: BorderSide(width: 1, color: ThemeColorYellow),
      //         borderRadius: BorderRadius.all(
      //           Radius.circular(5.0),
      //         ),
      //       )),
      //   focusNode: focusNode,
      //   icon: Icon(
      //     Icons.keyboard_arrow_down,
      //     color: focusNode.hasFocus ? ThemeColorYellow : ThemeColortext,
      //   ),
      //   hint: Text("Select"),
      //   elevation: 16,
      //   isExpanded: true,
      //   style: TextStyle(color: ThemeColortext),
      //   onChanged: (String? value) {
      //     widget.dropDownVlaue = value!;
      //     // This is called when the user selects an item.
      //     setState(() {
      //       widget.dropDownVlaue;
      //     });
      //   },
      //   value: widget.dropDownVlaue,
      //   items: widget.itemList.map<DropdownMenuItem<String>>((String value) {
      //     return DropdownMenuItem<String>(
      //       value: value,
      //       child: Text(
      //         value,
      //         style: productTextStyle,
      //       ),
      //     );
      //   }).toList(),
      // ),

  }
}

