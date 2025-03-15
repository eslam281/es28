import 'package:es28/veiw/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? sharedpref;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  sharedpref = await SharedPreferences.getInstance();
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      title: 'Demo',
      theme:ThemeData.light(),
      // darkTheme:ThemeData.dark() ,
      home:  HomePage()  ,
    );
  }
}