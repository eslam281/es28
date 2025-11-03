import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerReload extends StatelessWidget {
  const ShimmerReload({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
          child: Shimmer.fromColors(
            baseColor:context.isDarkMode? Colors.grey.shade800 :Colors.grey.shade200,
            highlightColor: Colors.white60,
            direction: ShimmerDirection.rtl,
            child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 6,
                itemBuilder: (context,index) {
                  return Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    margin: const EdgeInsets.only(bottom: 25),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      child: SizedBox(
                        height: 30,
                      ),
                    ),
                  );
                }
            ),
          ),
        ));
  }
}
