import 'package:flutter/material.dart';

class ElathakerEditPage extends StatelessWidget {
  final int? index;
  final controller;
  const ElathakerEditPage({super.key, this.index, required this.controller});

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    TextEditingController countController = TextEditingController();
    if(index!=null){
      textController.text = controller.athkar[index!][0];
      countController.text = controller.athkar[index!][1].toString();
    }
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        TextField(
          controller: textController,
        ),
        TextField(
          controller: countController,
        ),
        (index != null)
            ? IconButton(
                onPressed: () {
                  controller.edit(index!, textController.text,
                      int.parse(countController.text));
                },
                icon: const Icon(Icons.edit_rounded))
            : IconButton(
                onPressed: () {
                  controller.add(
                      textController.text, int.parse(countController.text));
                },
                icon: const Icon(Icons.add_task_outlined))
      ]),
    );
  }
}
