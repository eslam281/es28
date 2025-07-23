import 'package:es28/routes.dart';
import 'package:es28/veiw/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'core/class/theme.dart';
import 'core/functions/background_service.dart';
import 'core/functions/initBox.dart';
import 'core/services/time_service.dart';

Box? myBox;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  myBox = await initalBox("times");

  if(! await FlutterBackgroundService().isRunning()){
  await initializeService();
  await FlutterBackgroundService().startService();
  }
  FlutterBackgroundService().on('run_times').listen((event) async {
    print("📥 Main isolate received run_times");
    final result = await times(false, true);
    print("✅ times() ran in main isolate: $result");
  });

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
      theme:MyTheme.lightTheme,
      // darkTheme:ThemeData.dark() ,

      // home:  const Test(),
      getPages: routes,
      home:const SplashScreen(),
    );
  }
}