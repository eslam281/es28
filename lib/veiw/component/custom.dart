import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../../core/constant/color.dart';
import '../../core/constant/imageasset.dart';

class CustomButton extends StatefulWidget {
  final VoidCallback onPressed;
  const CustomButton({super.key, required this.onPressed});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _turns;
  double _rotation = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _turns = Tween<double>(begin: 0.0, end: 0.0).animate(_controller);
  }

  void rotateOnce() {
    final newRotation = _rotation + 1 / 10;
    _turns = Tween<double>(begin: _rotation, end: newRotation).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _rotation = newRotation;
    _controller.forward(from: 0);
  }

  void startInfiniteRotation() {
    _controller.duration = const Duration(seconds: 1);
    _turns = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.repeat();
  }

  void stopRotation() {
    _controller.stop();
    _controller.reset();
    _turns = Tween<double>(begin: _rotation, end: _rotation).animate(_controller);
    setState(() {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        rotateOnce();
        widget.onPressed();
      },
      onLongPressStart: (_) {
        startInfiniteRotation();
        widget.onPressed();
      },
      onLongPressEnd: (_) {
        stopRotation();
      },

      child: AnimatedBuilder(
        animation: _turns,
        builder: (context, child) {
          return Transform.rotate(
            angle: _turns.value * 2 * math.pi,

            child: Transform.translate(
              offset: const Offset(0, -25), // 👈 tweak this offset to fix center manually
              child: child,),

          );},

        child: SizedBox(
          width: 300, height: 300,
          child: Image.asset(AppImageAsset.saibh, color: AppColor.secondColor,),
        ),

      ),
    );
  }
}
