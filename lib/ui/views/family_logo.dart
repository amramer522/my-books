import 'dart:math';

import 'package:flutter/material.dart';

class FamilyLogoView extends StatefulWidget {
  const FamilyLogoView({Key? key}) : super(key: key);

  @override
  State<FamilyLogoView> createState() => _FamilyLogoViewState();
}

class _FamilyLogoViewState extends State<FamilyLogoView> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  late Animation<double> animation2;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 5));
    final curvedAnimation =
        CurvedAnimation(parent: controller, curve: Curves.bounceIn, reverseCurve: Curves.easeOut);

    animation2 = Tween<double>(begin: 0, end: 150).animate(curvedAnimation)
      ..addListener(() {
        setState(() {});
      });
    animation = Tween<double>(begin: 0, end: 4 * pi).animate(curvedAnimation)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Transform.rotate(angle: animation.value, child: FlutterLogo(size: 100)),
            Container(
              height: 10,
              margin: EdgeInsets.only(top: 16),
              width: animation2.value,
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
