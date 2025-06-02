import 'package:es28/routes.dart';
import 'package:es28/veiw/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'core/functions/initBox.dart';

// SharedPreferences? sharedpref;
Box? myBox;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // sharedpref = await SharedPreferences.getInstance();
  myBox = await initalBox("times");

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return  GetMaterialApp(
      title: 'Hisn Muslim',

      // textDirection: TextDirection.rtl,
      theme:ThemeData.light(),
      // darkTheme:ThemeData.dark() ,

      // home:  HomePage(),
      getPages: routes,
    );
  }
}