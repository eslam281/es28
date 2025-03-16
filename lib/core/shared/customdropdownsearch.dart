// import 'package:drop_down_list/drop_down_list.dart';
// import 'package:drop_down_list/model/selected_list_item.dart';
// import 'package:flutter/material.dart';
//
// class CustomDropDownSearch extends StatefulWidget {
//
//   final String? title;
//   final String? hintText;
//   final List<SelectedListItem> listdata;
//   final TextEditingController dropdownSelectedName ;
//   final TextEditingController dropdownSelectedId;
//
//   const CustomDropDownSearch({super.key, this.title, required this.listdata,
//     required this.dropdownSelectedName, required this.dropdownSelectedId, this.hintText});
//   @override
//   State<CustomDropDownSearch> createState() => _CustomDropDownSearchState();
// }
//
// class _CustomDropDownSearchState extends State<CustomDropDownSearch> {
//
//   void showDropdownSearch(){
//     DropDownState(
//       dropDown: DropDown(
//         isDismissible: true,
//         bottomSheetTitle:  Text(
//           widget.title!,
//           style: const TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 20.0,
//           ),
//         ),
//         submitButtonText: 'Save',
//         clearButtonText: 'Clear',
//         data: widget.listdata,
//         onSelected: (selectedItems) {
//           SelectedListItem selectedListItem=selectedItems[0];
//           widget.dropdownSelectedName.text = selectedListItem.name;
//           widget.dropdownSelectedId.text =selectedListItem.value!;
//         },
//       ),
//     ).showModal(context);
//   }
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller:widget.dropdownSelectedName,
//       cursorColor: Colors.black,
//       readOnly: true,
//       onTap: () {
//         FocusScope.of(context).unfocus();
//         showDropdownSearch();
//       },
//       decoration:  InputDecoration(
//         hintText:widget.hintText==""? "choose category": widget.hintText,
//           hintStyle: const TextStyle(fontSize: 14),
//           label: Container(
//               margin: const EdgeInsets.symmetric(horizontal: 9),
//               child: Text(
//                 "Category",
//                 style: Theme.of(context).textTheme.headlineMedium,
//               )),
//           suffixIcon: const Icon(Icons.arrow_drop_down),
//           contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
//           floatingLabelBehavior: FloatingLabelBehavior.always,
//           border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
//     );
//   }
// }
