


import 'package:es28/core/class/statusrequest.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../constant/imageasset.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
        child: Lottie.asset(AppImageAsset.loading, width: 250, height: 250))
        : statusRequest == StatusRequest.offlinefailure

        ? Center(child: Lottie.asset(AppImageAsset.offline,
            width: 250, height: 250))
        : statusRequest == StatusRequest.serverfailure

        ?  Center(child: Lottie.asset(AppImageAsset.sever,
            width: 250, height: 250, repeat: true))

        : statusRequest == StatusRequest.failure
        ? Center(
        child: Lottie.asset(AppImageAsset.noData,
            width: 250, height: 250, repeat: true))
        : widget;
  }
}

class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataRequest(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
        child: Lottie.asset(AppImageAsset.loading, width: 300, height: 300
            ,alignment: Alignment.center))

        : statusRequest == StatusRequest.offlinefailure
        ? Center(child: Lottie.asset(AppImageAsset.offline,
            width: 250, height: 250))

        : statusRequest == StatusRequest.serverfailure
        ? Center(child: Lottie.asset(AppImageAsset.sever,
        width: 250, height: 250, repeat: true))

        : widget;
  }
}