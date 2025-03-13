import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../component/custom.dart';
import '../../../controller/test7_controller.dart';

class Times extends StatelessWidget {
  const Times({super.key});

  @override
  Widget build(BuildContext context) {
    GetModle getcontroller = Get.find();
    return GetBuilder<Modle>(builder: (controller) =>
        Column(crossAxisAlignment:CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 50,),

            if(getcontroller.data.isEmpty||!getcontroller.result||getcontroller.isLoading)
              Column(
                children: [
                if(getcontroller.result)
                  const Text("Loading....",style:TextStyle(fontSize:50,color: Colors.blue),),
                if(!getcontroller.result)
                  const Text("No internet",style:TextStyle(fontSize:50,color: Colors.blue),),
                const SizedBox(height: 50,),
                const CircularProgressIndicator(),
              ],
              ),

            if( getcontroller.result && !getcontroller.isLoading)
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  customCard(text: " فجر   ${getcontroller.Fajr}"),
                  customCard(text: " شروق الشمس   ${getcontroller.Sunrise}"),
                  customCard(text: "  ظهر   ${getcontroller.Dhuhr}"),
                  customCard(text: " عصر   ${getcontroller.Asr}"),
                  customCard(text: " مغرب   ${getcontroller.Maghrib}"),
                  customCard(text: " عشاء   ${getcontroller.Isha}"),
                ],
              ),
            const SizedBox(height: 20,)
          ],),

    );
  }
}
