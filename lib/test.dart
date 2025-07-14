import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    String text = "Stop Service";
    return Scaffold(
      body: Center(child: Column(mainAxisAlignment:MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: () {
            FlutterBackgroundService().invoke("setAsForeground");
          }, child: const Text("Foreground Service")),

          ElevatedButton(onPressed: () {
            FlutterBackgroundService().invoke("setAsBackground");
          }, child: const Text("Background Service")),
          ElevatedButton(onPressed: () async{

            bool isRunning =await FlutterBackgroundService().isRunning();
            if(isRunning){
              FlutterBackgroundService().invoke("stopService");
            }else{
              FlutterBackgroundService().startService();
            }
            if(!isRunning){
              text="Stop Service";
            }else{
              text="Start Service";
            }
            setState(() {});
          }, child: Text(text)),
          ],),),
    );
  }
}
