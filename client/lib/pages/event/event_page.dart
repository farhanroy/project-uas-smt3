
import 'package:client/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'event_controller.dart';

class EventPage extends GetView<EventController> {
  const EventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getAllEvent();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('List Event'),
          actions: [
            IconButton(
                onPressed: () => Get.toNamed(AppRoutes.profile),
                icon: const Icon(Icons.person))
          ],
        ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Get.toNamed(AppRoutes.add),
      ),
      body: controller.obx(
              (state) => ListView.builder(
                  itemCount: controller.state?.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: ListTile(
                          title: Text(controller.state![index].name!),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8,),
                              Text("Mulai: ${controller.state![index].start}"),
                              const SizedBox(height: 8,),
                              Text("Akhir: ${controller.state![index].end}")
                            ],
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                Get.defaultDialog(
                                  title: "QR Code",
                                  content: SizedBox(
                                    height: 180,
                                    width: 180,
                                    child: QrImage(
                                      data: controller.state![index].token ?? "123",
                                      version: QrVersions.auto,
                                      size: 30,
                                      gapless: false,
                                    ),
                                  ),
                                  textConfirm: "Sudah",
                                  contentPadding: EdgeInsets.all(16),
                                  onConfirm: () {
                                    Get.back();
                                  }
                                );
                              },
                              icon: Icon(Icons.remove_red_eye)),
                          onLongPress: () {
                            Get.defaultDialog(
                                title: "Hapus",
                                content: Text("Apakah anda yakin menghapus event ini ?"),
                                textConfirm: "Ok",
                                contentPadding: EdgeInsets.all(16),
                                textCancel: "Batal",
                                onConfirm: () {
                                  Get.back();
                                  controller.deleteEvent(controller.state![index].id!);
                                }
                            );

                          },
                          onTap: () => Get.toNamed(AppRoutes.detail, arguments: [controller.state![index].id!]),
                        ),
                      ),
                    );
                  }),
        onLoading: Center(child: CircularProgressIndicator()),
        onEmpty: Center(child: Text("Data tidak ada")),
        onError: (message) => Center(child: Text(message ?? "Ada error terjadi")),

      )
    );
  }
}
