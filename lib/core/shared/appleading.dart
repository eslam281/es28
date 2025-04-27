import 'package:flutter/material.dart';

import '../constant/color.dart';

class Appleading extends StatelessWidget {
  const Appleading({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed:() => Navigator.of(context).pop(),
        icon: const Icon(Icons.arrow_back,color:AppColor.secondColor,));
  }
}
