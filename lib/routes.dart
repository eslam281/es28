
import 'package:es28/view/screen/drawer/Aboutus.dart';
import 'package:es28/view/screen/drawer/Alarm.dart';
import 'package:es28/view/screen/drawer/Qibla.dart';
import 'package:es28/view/screen/drawer/contact_Us.dart';
import 'package:es28/view/screen/drawer/setting.dart';
import 'package:es28/view/screen/drawer/timesfor30.dart';
import 'package:es28/view/screen/home.dart';
import 'package:es28/view/screen/home/althakr/athkar_AP.dart';
import 'package:es28/view/screen/home/althakr/friday/athkar_Friday.dart';
import 'package:es28/view/screen/home/althakr/athkar_SM.dart';
import 'package:es28/view/screen/home/althakr/friday/pray_elnaby.dart';
import 'package:es28/view/screen/home/althakr/friday/surat_al_kahf.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'core/constant/routes.dart';

List<GetPage<dynamic>>? routes =[
  GetPage(name:AppRoute.home, page:() => HomePage() ),
  GetPage(name:AppRoute.qiblaPage, page:() => const QiblaPage() ),
  GetPage(name:AppRoute.timesfor30, page:() => const Timesfor30Widget() ),
  GetPage(name:AppRoute.alarm, page:() => const Alarm() ),
  GetPage(name:AppRoute.setting, page:() => const Setting() ),
  GetPage(name:AppRoute.about_us, page:() => const About_us() ),
  GetPage(name:AppRoute.contact_us, page:() => const Contact_Us() ),
  GetPage(name:AppRoute.athkar_SM, page:() => const AthkarSM() ),
  GetPage(name:AppRoute.athkarAP, page:() => const AthkarAP() ),
  GetPage(name:AppRoute.athkarFriday, page:() => const AthkarFriday() ),
  GetPage(name:AppRoute.prayElnaby, page:() => const PrayElnaby() ),
  GetPage(name:AppRoute.surat_Al_Kahf, page:() => const Surat_Al_Kahf() ),
];