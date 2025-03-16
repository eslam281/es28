
import 'package:es28/veiw/screen/drawer/Aboutus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/count_controller.dart';
import '../../controller/home_controller.dart';

class HomePage extends StatefulWidget {

  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    CountControllerImp controllerCount =  Get.put(CountControllerImp());

    return GetBuilder<HomeControllerImp>(
      builder: (controller) {
        return Scaffold(

            floatingActionButton:(controller.index==0)?
                FloatingActionButton(
                  onPressed: () {controllerCount.seti();
                    controllerCount.setCounter("ادخل الذكر ");
                    },
                  child:  const Column(
                      children: [
                        SizedBox(height:3),
                        Icon(Icons.settings_backup_restore_outlined,size: 30,),
                const Text("reset",style:TextStyle(color:Colors.white),)
              ],
                ),backgroundColor: Colors.blue
            ):null,
            
            appBar: AppBar(title: const Text("سبح اسم ربك الاعلى\t"),backgroundColor: Colors.blue,),

            drawer: Drawer(child: Container(padding: const EdgeInsets.all(10),child: Column(children: [
              const SizedBox(height: 100,)
          
              ,const ListTile(title: Text("Contact Us"),leading: Icon(Icons.comment_outlined),)

              ,Container(alignment:Alignment.centerLeft, child: MaterialButton
                  (child: const ListTile(title: Text("About Us"),leading: Icon(Icons.info))
                  ,onPressed: () {Get.to(const About_us());},),),

            ],)
              ,),),

            bottomNavigationBar: BottomNavigationBar(
                onTap: (val){
                  controller.setIndex(val);
                  // if(!getcontroller.result&&val==2)getcontroller.iscontnect();
                  },currentIndex:controller.index,
                items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home),label:"الصفحة الرئسية"),
              BottomNavigationBarItem(icon: Icon(Icons.access_time),label:"أوقات الصلاة"),
              BottomNavigationBarItem(icon: Icon(Icons.menu_book_outlined),label:"الاذكار"),
            ]),

            body:  controller.bodyList[controller.index]

        );
      }
    );
  }
}
