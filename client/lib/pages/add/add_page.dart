import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/common_textfield.dart';
import 'add_controller.dart';

class AddPage extends GetView<AddController> {
  const AddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Tambah Event'),
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CommonTextField(
              Lone: "Acara",
              Htwo: "Acara",
              onChanged: (val) => controller.nameChanged(val),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Mulai',
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1)),
              ),
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2050));

                if (pickedDate != null) {
                  controller.startChanged(pickedDate.toIso8601String());
                }
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Selesai',
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1)),
              ),
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2050));

                if (pickedDate != null) {
                  controller.endChanged(pickedDate.toIso8601String());
                }
              },
            ),
            const SizedBox(height: 20),
            TextButton(onPressed: () => controller.submit(), child: Text('Tambahkan'))
          ],
        ),
      ),
    );
  }
}
