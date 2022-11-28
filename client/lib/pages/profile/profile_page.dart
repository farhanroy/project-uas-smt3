import 'package:client/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/helper.dart';
import 'profile_controller.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getData();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Profil'),
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back)),
        ),
      body: controller.obx(
              (state) => SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 56),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 28),
                        child: Builder(
                            builder: (context) {
                              return Column(
                                children: [
                                  _ProfileItem(title: "Nama", content: controller.state![2]),
                                  _ProfileItem(title: "Email", content: controller.state![3]),
                                  _ProfileItem(title: "NRP", content: controller.state![4]),
                                ],
                              );
                            }
                        )
                    ),
                    const SizedBox(height: 56),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 72.0),
                      child: OutlinedButton(
                          onPressed: () => {
                            controller.logout().then((value) {
                              Get.offNamed(AppRoutes.splash);
                            })
                          },
                          style: OutlinedButton.styleFrom(
                            primary: Colors.red,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () => controller.logout(),
                                  icon: const Icon(Icons.logout)
                              ),
                              Text('Logout')
                            ],
                          )
                      ),
                    ),
                  ],
                ),
              ),
        onLoading: Center(child: const CircularProgressIndicator())
      )
    );
  }
}

class _ProfileItem extends StatelessWidget {
  final String title;
  final String content;
  const _ProfileItem({Key? key, required this.title, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(title, style: const TextStyle(color: Colors.black38, fontSize: 12)),
        const SizedBox(height: 4),
        Text(content),
        const SizedBox(height: 6),
        const Divider()
      ],
    );
  }
}
