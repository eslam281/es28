import 'package:es28/core/constant/routes.dart';
import 'package:es28/veiw/screen/drawer/Aboutus.dart';
import 'package:es28/veiw/screen/drawer/Qibla.dart';
import 'package:es28/veiw/screen/drawer/surat_al_kahf.dart';
import 'package:es28/veiw/screen/home.dart';
import 'package:es28/veiw/screen/home/althakr/athkar_Friday.dart';
import 'package:es28/veiw/screen/home/althakr/athkar_SM.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>>? routes =[
  GetPage(name:AppRoute.home, page:() => HomePage() ),
  GetPage(name:AppRoute.qiblaPage, page:() => const QiblaPage() ),
  GetPage(name:AppRoute.about_us, page:() => const About_us() ),
  GetPage(name:AppRoute.athkar_SM, page:() => const AthkarSM() ),
  GetPage(name:AppRoute.athkarFriday, page:() => const AthkarFriday() ),
  GetPage(name:AppRoute.surat_Al_Kahf, page:() => const Surat_Al_Kahf() ),
];