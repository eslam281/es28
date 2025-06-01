import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

Future<Box> initalBox(String name)async{
  if(!Hive.isBoxOpen(name)){
    Hive.init((await getApplicationDocumentsDirectory()).path);
  }
  return Hive.openBox(name);
}