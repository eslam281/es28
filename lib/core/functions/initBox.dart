import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

Future<Box> initalBox(String boxName)async{
  if(!Hive.isBoxOpen(boxName)){
    Hive.init((await getApplicationDocumentsDirectory()).path);
  }
  return Hive.openBox(boxName);
}
Future<BoxCollection> initalCollectionBox(String collectionBoxName,Set<String> boxsName)async{
  final collection = await BoxCollection.open(
    collectionBoxName, // Name of your database
    boxsName, // Names of your boxes
    path: (await getApplicationDocumentsDirectory()).path,
  );
  return collection;
}