import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'elathaker_controller.dart';

class ElathakerEditPage extends StatelessWidget {
  final int? index;
  const ElathakerEditPage({super.key, this.index});

  @override
  Widget build(BuildContext context) {
    ElathakerController controller = Get.find();
    TextEditingController textController = TextEditingController();
    TextEditingController countController = TextEditingController();
    if(index!=null){
      textController.text = controller.athkar[index!][0];
      countController.text = controller.athkar[index!][1].toString();
    }
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<ElathakerController>(
        builder: (controller) {
          return Column(children: [

              TextField(
                controller:textController ,
              ),
            TextField(
                controller:countController ,
              ),

            (index!=null)?

              IconButton(onPressed: () {
                controller.edit(index!, textController.text, int.parse(countController.text));
              }, icon: const Icon(Icons.edit_rounded)):

            IconButton(onPressed: () {
              controller.add( textController.text, int.parse(countController.text));
            }, icon: const Icon(Icons.add_task_outlined))
          ]);
        }
      ),
    );
  }
}
