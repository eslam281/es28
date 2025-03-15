
import 'package:es28/veiw/screen/drawer/Aboutus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/home_controller.dart';

class HomePage extends StatefulWidget {

  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  // GetModle getcontroller = Get.put(GetModle());



  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (controller) {
        return Scaffold(
            appBar: AppBar(title: const Text("سبح اسم ربك الاعلى\t"),backgroundColor: Colors.blue,),

            drawer: Drawer(child: Container(padding: const EdgeInsets.all(10),child: ListView(children: [
              SizedBox(height: 50,)
              ,const ListTile(title: Text("Homepage"),leading: Icon(Icons.home),)
              ,const ListTile(title: Text("Account"),leading: Icon(Icons.account_balance_rounded),)
              ,const ListTile(title: Text("order"),leading: Icon(Icons.check_box),)
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
              BottomNavigationBarItem(icon: Icon(Icons.settings),label:"أعدادات"),
            ]),

            body: Container(
              color: Colors.black,height: double.infinity,padding:const EdgeInsets.all(20) ,
              child:  SingleChildScrollView(
                child: controller.bodyList[controller.index]
                 ),
            )
        );
      }
    );
  }
}
