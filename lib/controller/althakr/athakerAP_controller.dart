import 'package:get/get.dart';

import '../../main.dart';



class athakerAPController extends GetxController{
  late List<List<dynamic>> athkar;
  List count=[];

  @override
  void onInit() {
    if (myBox?.get("athkarAP") != null)
      athkar = myBox?.get("athkarAP").map<List<dynamic>>((e) => List<dynamic>.from(e)).toList();
    else
      athkar = _athkarBase;
    count.length = athkar.length;
    count.fillRange(0, athkar.length,0);
    super.onInit();
  }

  onTap(int index){
    if(athkar[index][1] > count[index]){
      count[index] += 1;
    }
    update();
  }

  customRefresh(){
    count.fillRange(0, athkar.length, 0);
    update();
  }

  add(String text, int itemCount){
    athkar.add([text, itemCount]);
    count.add(0);
    myBox?.put("athkarAP", athkar);
    update();
    Get.back();
  }
  delete(int index) {
    athkar.removeAt(index);
    count.removeAt(index);
    myBox?.put("athkarAP", athkar);
    update();
    Get.back();
  }
  edit(int index, String text, int count) {
    athkar[index][0] = text;
    athkar[index][1] = count;
    myBox?.put("athkarAP", athkar);
    update();
    Get.back();
  }
  restore(){
    athkar =_athkarBase;
    count.length = athkar.length;
    count.fillRange(0, athkar.length, 0);
    myBox?.put("athkarAP", athkar);
    Get.back();
    update();
  }

  List<List<dynamic>> _athkarBase = [
    ["أستغفر الله", 3],
    ["اللهم أنت السلام، ومنك السلام، تباركت يا ذا الجلال والإكرام", 1],
    ["لا إله إلا الله وحده لا شريك له، له الملك وله الحمد وهو على كل شيء قدير، لا حول ولا قوة إلا بالله، لا إله إلا الله، ولا نعبد إلا إياه، له النعمة وله الفضل، وله الثناء الحسن، لا إله إلا الله مخلصين له الدين ولو كره الكافرون", 1],
    ["سبحان الله", 33],
    ["الحمد لله", 33],
    ["الله أكبر", 33],
    ["لا إله إلا الله وحده لا شريك له، له الملك وله الحمد وهو على كل شيء قدير", 1],
    ["سورة الإخلاص", 1],
    ["سورة الفلق", 1],
    ["سورة الناس", 1],
    ["سورة الإخلاص (بعد المغرب والفجر)", 3],
    ["سورة الفلق (بعد المغرب والفجر)", 3],
    ["سورة الناس (بعد المغرب والفجر)", 3],
    ["آية الكرسي", 1],
    ["لا إله إلا الله وحده لا شريك له، له الملك وله الحمد، يحيي ويميت وهو على كل شيء قدير (بعد المغرب والصبح)", 10],
    ["اللهم إني أسألك علماً نافعاً، ورزقاً طيباً، وعملاً متقبلاً (بعد الفجر)", 1],
  ];

}