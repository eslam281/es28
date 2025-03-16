// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../controller/home_controller.dart';
//
// class Setting extends StatelessWidget {
//   const Setting({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//     return GetBuilder<HomeControllerImp>(builder: (controller) =>
//         Column(
//           crossAxisAlignment:CrossAxisAlignment.stretch,
//           children: [
//             SizedBox(height: 50,),
//
//             const SizedBox(height: 30,),
//
//             if(Get.isDarkMode)
//               Card(child: IconButton(icon:  Icon(Icons.light_mode),
//                   onPressed: () {
//                     Get.changeTheme(ThemeData.light());
//                     controller.update();
//                   }),),
//
//             if(!Get.isDarkMode)
//               Card(child: IconButton(icon: const Icon(Icons.dark_mode), onPressed: (){
//                 Get.changeTheme(ThemeData.dark());
//                 controller.update();
//               },)
//               ),
//           ],),
//     );
//   }
// }
