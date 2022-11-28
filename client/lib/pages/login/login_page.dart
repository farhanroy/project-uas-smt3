import 'package:client/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/common_textfield.dart';
import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

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
                "Masuk",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                )),
            const SizedBox(
              height: 8,
            ),
            Text(
                "Tolong masukan akun anda untuk menggunakan fitur",
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                )),
            const SizedBox(
              height: 150,
            ),
            CommonTextField(
              Lone: "Email",
              Htwo: "Email",
              onChanged: (val) => controller.emailChanged(val),
            ),
            const SizedBox(height: 20),
            CommonTextField(
              Lone: "Password",
              Htwo: "Password",
              isObscure: true,
              onChanged: (val) => controller.passwordChanged(val),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () => controller.submit(),
              child: const Text("Login"),
            ),
            const SizedBox(height: 56.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Belum memiliki akun ?'),
                TextButton(
                  onPressed: () => Get.toNamed(AppRoutes.register),
                  child: const Text("Daftar"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
