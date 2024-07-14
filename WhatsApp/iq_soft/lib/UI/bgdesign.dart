import 'dart:ui';
import 'package:flutter/material.dart';
// import 'package:rive/rive.dart';
// import '../constant/root.dart';

class BgDesgin extends StatelessWidget {
  final Widget page;
  const BgDesgin({required this.page, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // RiveAnimation.asset(Root.bgimg),
        Positioned.fill(
          child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: const SizedBox()),
        ),
        page
      ],
    );
  }
}
