
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Beranda'),
        actions: [
          IconButton(
              onPressed: () => Get.toNamed(AppRoutes.profile),
              icon: const Icon(Icons.person))
        ],
      ),
      body: Center(
        child: TextButton(
          onPressed: () => controller.submit(),
          child: Text('Scan'),
        ),
      ),
    );
  }
}
