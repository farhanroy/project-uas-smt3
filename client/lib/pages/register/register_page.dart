import 'package:client/pages/register/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/common_textfield.dart';
import '../../routes/app_routes.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 56),
            Text(
                "Daftar",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                )),
            const SizedBox(
              height: 8,
            ),
            Text(
                "Masukan inputan dibawah ini untuk mengakses fitur aplikasi kami",
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                )),
            const SizedBox(
              height: 32,
            ),
            CommonTextField(
              Lone: "Email",
              Htwo: "Email",
              onChanged: (val) => controller.emailChanged(val),
            ),
            const SizedBox(height: 20),
            CommonTextField(
              Lone: "Nama",
              Htwo: "Nama",
              onChanged: (val) => controller.nameChanged(val),
            ),
            const SizedBox(height: 20),
            CommonTextField(
              Lone: "NRP",
              Htwo: "NRP",
              onChanged: (val) => controller.nrpChanged(val),
            ),
            const SizedBox(height: 20),
            CommonTextField(
              Lone: "Password",
              Htwo: "Password",
              onChanged: (val) => controller.passwordChanged(val),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () => controller.submit(),
              child: const Text("Daftar"),
            ),
            const SizedBox(height: 56.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Sudah memiliki akun ?'),
                TextButton(
                  onPressed: () => Get.toNamed(AppRoutes.login),
                  child: const Text("Masuk"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
