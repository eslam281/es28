import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../component/custom.dart';
import '../../../component/dropdownlist.dart';
import '../../../controller/test7_controller.dart';
import '../../../main.dart';

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textcontroll = TextEditingController();

    return GetBuilder<Modle>(builder: (controller) {
      if (controller.status)
      return  Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SizedBox(height: 50,),
          Column(children: [
            AppTextField(textEditingController: textcontroll,
              title: "الذكر",
              hint: "الذكر",
              isCitySelected: true,
              cities: [
                SelectedListItem(name: "سبحان الله"),
                SelectedListItem(name: "الحمد الله"),
                SelectedListItem(name: "الله اكبر",),
              ],),
            MaterialButton(onPressed: () {
              controller.setCounter(textcontroll.text);
            },
                color: Colors.green,
                child: const Text("count", style: TextStyle(fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFE700)),)),
          ],),

          const SizedBox(height: 150,),

          Text("${sharedpref?.getString("counter")} ${sharedpref?.getInt("i")}",
            style: const TextStyle(fontSize: 50, color: Color(0xFFFFE700)),
            softWrap: true,),
          const SizedBox(height: 30,),
          customButton(iconName: Icons.add
              , onPressed: () {
            controller.Addi();
          }),
        ],);
      return Container();
    }
    );
  }
}
