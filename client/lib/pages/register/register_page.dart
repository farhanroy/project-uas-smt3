import 'package:client/pages/register/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/common_textfield.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
