import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Dynamic Attendance',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
