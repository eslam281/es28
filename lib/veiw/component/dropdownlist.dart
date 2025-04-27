
import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:es28/core/constant/color.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String title;
  final String hint;
  final bool isCitySelected;
  final List<SelectedListItem>? cities;

   AppTextField({
    required this.textEditingController,
    required this.title,
    required this.hint,
    required this.isCitySelected,
    this.cities,
    super.key,
  });
   String getthaker(){
    return textEditingController.text;
  }


  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {

  /// This is on text changed method which will display on city text field on changed.
  void onTextFieldTap()async {
    DropDownState(
      DropDown(
        isDismissible: true,
        bottomSheetTitle:  Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        clearButtonChild: const Text(
          'Clear',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: widget.cities ?? [],
        selectedItems: (List<dynamic> selectedList) {

          List<String> list = [];
          for (var item in selectedList) {
            if (item is SelectedListItem &&item.name != "+" ) {
              list.add(item.name);
              widget.textEditingController.text= item.name;
            }
          }
          showSnackBar(list.toString());
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(widget.title,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
        const SizedBox(
          height: 5.0,
        ),
        TextFormField(
          controller: widget.textEditingController,
          cursorColor: AppColor.secondColor,
          keyboardType:TextInputType.name,
          textDirection: TextDirection.rtl,
          onTap: widget.isCitySelected
              ? () {
            FocusScope.of(context).unfocus();
            onTextFieldTap();
          }
              : null,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColor.grey,
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
            hintText: widget.hint,hintStyle: const TextStyle(color:AppColor.black),
            hintTextDirection: TextDirection.rtl,
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
      ],
    );
  }
}