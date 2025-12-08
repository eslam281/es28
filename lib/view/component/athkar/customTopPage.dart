import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../core/functions/alertexitapp.dart';

class CustomTopPage extends StatelessWidget {
  final void Function() changeThemeMode;
  final void Function() restore;
  final void Function() increaseTextSize;
  final void Function() decreaseTextSize;
  const CustomTopPage({super.key, required this.changeThemeMode, required this.restore, required this.increaseTextSize, required this.decreaseTextSize});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween ,
            children: [
              CircleAvatar(
                backgroundColor: AppColor.secondColor.withAlpha(30),
                child: IconButton(
                  icon: Icon(
                    context.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                    color: AppColor.secondColor,
                  ),
                  onPressed:() => changeThemeMode() ,
                ),
              ),
              CircleAvatar(
                backgroundColor: AppColor.secondColor.withAlpha(30),
                child: IconButton(
                  icon: Icon(Icons.restore_page_outlined,
                    color: AppColor.secondColor,
                  ),
                  onPressed:() {
                    alertApp("هل تريد استعادة كافة البيانات؟","موافق",
                            () => restore(),);
                  } ,
                ),
              ),
              Row(children: [
                CircleAvatar(
                  backgroundColor: AppColor.secondColor.withAlpha(30),
                  child: Icon(Icons.text_fields, color: AppColor.secondColor),
                ),
                IconButton(
                  icon: Text("-A", style: TextStyle(color: AppColor.secondColor)),
                  onPressed:() => increaseTextSize(),
                ),
                IconButton(
                  icon: Text("+A", style: TextStyle(color: AppColor.secondColor)),
                  onPressed: () => decreaseTextSize(),
                ),
              ],)
            ],
          ),
        ),
      ),
    );
  }
}
