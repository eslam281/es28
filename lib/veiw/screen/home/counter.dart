import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/count_controller.dart';
import '../../component/custom.dart';
import '../../component/dropdownlist.dart';

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {

    return GetBuilder<CountControllerImp>(builder: (controller) {
      return  Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const SizedBox(height: 50,),

          Column(children: [
            AppTextField(textEditingController:controller.textcontroll,
              title: "الذكر",
              hint: "أدخل الذكر",
              isCitySelected: true,
              cities: [
                SelectedListItem(name: "سبحان الله"),
                SelectedListItem(name: "الحمد الله"),
                SelectedListItem(name: "الله اكبر",),
                SelectedListItem(name: "+",),
              ],),

            const SizedBox(height: 5,),
            MaterialButton(onPressed: () {
              controller.setCounter(controller.textcontroll.text);
            },
                color: Colors.blue,
                child: const Text("ادخل الذكر", style: TextStyle(fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFE700)),)),
          ],),

          const SizedBox(height: 50,),

          Column(
            children: [
              Text("${controller.counter} ${controller.i}",
                style: const TextStyle(fontSize: 50, color: Color(0xFFFFE700)),
                softWrap: true,textDirection:TextDirection.rtl,),
              const SizedBox(height: 20,),
              customButton(iconName: Icons.add
                  , onPressed: () {
                    controller.Addi();
                  }),
            ],
          ),
        const SizedBox(height: 50,),
        ],);
    }
    );
  }
}
