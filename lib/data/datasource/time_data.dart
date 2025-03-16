

import '../../core/class/crud.dart';

class TimeData{

  Crud crud;

  TimeData(this.crud);

  getData(String link)async{
    var response =
    await crud.getData( link);
    return response.fold((l) => l, (r) => r,);
  }
}