import 'package:get/get.dart';

import '../main.dart';


class athakerAPController extends GetxController{
  double textScaler = myBox?.get("textScaler");
  List count=[];

  @override
  void onInit() {
    count.length = adhkar.length;
    count.fillRange(0, adhkar.length,0);
    super.onInit();
  }

  onTap(int index){
    if(adhkar[index][1] > count[index]){
      count[index] += 1;
    }
    update();
  }

  customRefresh(){
    count.fillRange(0, adhkar.length, 0);
    update();
  }
  void changeTextScaler(double val){
    if(textScaler+val<=.8||textScaler+val>=2.91) return;
    textScaler += val;
    print(textScaler);
    update();
  }

  List<List<dynamic>> adhkar = [
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