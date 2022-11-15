
import 'package:client/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'event_controller.dart';

class EventPage extends GetView<EventController> {
  const EventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(AppRoutes.add),
      ),
      body: Builder(
        builder: (context) {
          if (controller.status.isSuccess) {
            return ListView.builder(
                itemBuilder: (context, size) {
                  return ListTile();
                });
          } else {
            return const CircularProgressIndicator();
          }
        },
      )
    );
  }
}
