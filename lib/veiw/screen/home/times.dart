import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../component/custom.dart';
import '../../../controller/test7_controller.dart';

class Times extends StatelessWidget {
  const Times({super.key});

  @override
  Widget build(BuildContext context) {
     Get.put(GetModle());
    return GetBuilder<GetModle>(builder: (controller) =>
        Column(crossAxisAlignment:CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 50,),

            (controller.data == null||!controller.result||controller.isLoading)?
              Column(
                children: [
                (controller.isLoading)?
                  Column(
                    children: [
                      const Text("Loading....",style:TextStyle(fontSize:50,color: Colors.blue),),
                      const SizedBox(height: 50,),
                      Center(child: const CircularProgressIndicator()),
                    ],
                  ):
                (!controller.result)?
                  const Text("No internet",style:TextStyle(fontSize:50,color: Colors.blue),):Center(),

              ],
              )

            :
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  customCard(text: " فجر   ${controller.data!.fajr}"),
                  customCard(text: " شروق الشمس   ${controller.data!.sunrise}"),
                  customCard(text: "  ظهر   ${controller.data!.dhuhr}"),
                  customCard(text: " عصر   ${controller.data!.asr}"),
                  customCard(text: " مغرب   ${controller.data!.maghrib}"),
                  customCard(text: " عشاء   ${controller.data!.isha}"),
                  customCard(text: " الثلث الاخير من الليل   ${controller.data!.lastthird}"),
                ],
              ),
            const SizedBox(height: 20,)
          ],),

    );
  }
}
