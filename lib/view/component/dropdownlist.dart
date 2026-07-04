import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:es28/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String title;
  final String hint;
  final bool isCitySelected;
  final List<SelectedListItem<String>>? cities;
  final Function(String)? onDelete; // Added onDelete callback

  const AppTextField({
    required this.textEditingController,
    required this.title,
    required this.hint,
    required this.isCitySelected,
    this.cities,
    this.onDelete,
    super.key,
  });

  String getthaker() {
    return textEditingController.text;
  }

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  /// This is on text changed method which will display on city text field on changed.
  void onTextFieldTap() async {
    DropDownState<String>(
      dropDown: DropDown<String>(
        isDismissible: true,
        bottomSheetTitle: Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        data: widget.cities ?? [],
        listItemBuilder: (index, item) {
          return GestureDetector(
            onLongPress: () {
              if (widget.onDelete != null && item.data != "+") {
                Get.defaultDialog(
                  title: "حذف الذكر",
                  middleText: "هل تريد حذف هذا الذكر من قائمتك؟",
                  confirm: TextButton(
                    onPressed: () {
                      widget.onDelete!(item.data);
                      Get.back(); // Close dialog
                      Get.back(); // Close dropdown
                    },
                    child: const Text("حذف", style: TextStyle(color: Colors.red)),
                  ),
                  cancel: TextButton(
                    onPressed: () => Get.back(),
                    child: const Text("إلغاء"),
                  ),
                );
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey.withAlpha(50),
                    width: 0.5,
                  ),
                ),
              ),
              child: Text(
                item.data,
                textDirection: TextDirection.rtl,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          );
        },
        onSelected: (List<SelectedListItem<String>> selectedList) {
          for (var item in selectedList) {
            if (item.data == "+") {
              widget.textEditingController.clear();
            } else {
              widget.textEditingController.text = item.data;
            }
          }
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
        Text(
          widget.title,
          style: const TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(
          height: 5.0,
        ),
        TextFormField(
          controller: widget.textEditingController,
          cursorColor: AppColor.secondColor,
          keyboardType: TextInputType.name,
          textDirection: TextDirection.rtl,
          onTap: widget.isCitySelected
              ? () {
                  FocusScope.of(context).unfocus();
                  onTextFieldTap();
                }
              : null,
          decoration: InputDecoration(
            filled: true,
            suffixIcon: Icon(Icons.arrow_drop_down, color: AppColor.secondColor),
            fillColor: AppColor.grey,
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
            hintText: widget.hint,
            hintStyle: const TextStyle(color: AppColor.black),
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
