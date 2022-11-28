
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'detail_controller.dart';

class DetailPage extends GetView<DetailController> {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arg = Get.arguments;
    controller.idEventChanged(arg[0]);
    controller.getAllAttendance();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Detail Event'),
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back)),
      ),
      body: controller.obx(
              (state) => ListView.builder(
                itemCount: controller.state!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(controller.state![index].name!),
                      subtitle: Text("Waktu: ${controller.state![index].time!}"),
                      trailing: IconButton(
                        onPressed: () {
                          Get.defaultDialog(
                              title: "Hapus",
                              content: const Text("Apakah anda yakin menghapus data ini ?"),
                              textConfirm: "Ok",
                              contentPadding: const EdgeInsets.all(16),
                              textCancel: "Batal",
                              onConfirm: () {
                                Get.back();
                                controller.deleteAttendance(controller.state![index].id!);

                              }
                          );
                        },
                        icon: Icon(Icons.delete),
                      ),
                    );
                  }),
        onError: (text) => Text(text ?? "Error"),
        onLoading: const Center(child: CircularProgressIndicator()),
        onEmpty: const Center(child: Text('Data tidak ada'))
      ),
    );
  }
}
