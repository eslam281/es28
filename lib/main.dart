import 'package:es28/veiw/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? sharedpref;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  sharedpref = await SharedPreferences.getInstance();
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

      home:  HomePage(),
    );
  }
}