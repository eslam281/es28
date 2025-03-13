
import 'package:es28/main.dart';
import 'package:es28/veiw/screen/drawer/Aboutus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/home_controller.dart';
import '../../controller/test7_controller.dart';

class HomePage extends StatefulWidget {

  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Modle controller = Get.put(Modle());
  GetModle getcontroller = Get.put(GetModle());

  List<Widget>listWidget=[
    const Text("الحمد لله",style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.bold)),
    Container(padding: const EdgeInsets.all(70),alignment: Alignment.center,margin: const EdgeInsets.only(left: 50),
      child: const Text(" اللهم صل  علي محمد ",style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.bold)),
    ),
      // const Image(image: AssetImage("Images/954.jpg"),fit: BoxFit.fill,height:600,),
  ];

  @override
  void initState() {
    if(sharedpref?.getInt("i")!=null)
    controller.seti(sharedpref?.getInt("i"));
    else{
      controller.seti(0);
      controller.setCounter("ادخل الذكر ");
    }
    getcontroller.iscontnect();
    setState(() {});
    super.initState();
  }
  // @override
  // void dispose() {
  //   textcontroll.dispose();
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (controller2) {
        return Scaffold(
            floatingActionButton: FloatingActionButton(
                onPressed: () {controller.seti(0);controller.setCounter("ادخل الذكر ");;},
                child: const Icon(Icons.settings_backup_restore_outlined),backgroundColor: Colors.blue,
              ),

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
                  controller2.setIndex(val);
                  if(!getcontroller.result&&val==2)getcontroller.iscontnect();
                  },currentIndex:controller2.index,
                items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home),label:"الصفحة الرئسية"),
              BottomNavigationBarItem(icon: Icon(Icons.access_time),label:"أوقات الصلاة"),
              BottomNavigationBarItem(icon: Icon(Icons.settings),label:"أعدادات"),
            ]),

            body: Container(
              color: Colors.black,height: double.infinity,padding:const EdgeInsets.all(20) ,
              child:  SingleChildScrollView(
                child: controller2.bodyList[controller2.index]
                 ),
            )
        );
      }
    );
  }
}
