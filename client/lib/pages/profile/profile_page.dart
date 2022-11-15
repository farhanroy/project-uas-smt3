import 'package:client/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/helper.dart';
import '../../utils/styles.dart';
import 'profile_controller.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {

  List<String> list = [];

  @override
  void initState() {
    super.initState();
    Future.wait([getUserData()]);
  }

  Future<void> getUserData() async {
    final pref = await SharedPreferences.getInstance();
    final data = pref.getStringList('data');
    setState(() {
      list = data!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFF7F4F4),
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: Styles.primaryColor,
        ),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)
        ),
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 56),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Builder(
                    builder: (context) {
                      if (list.isNotEmpty) {
                        return Column(
                          children: [
                            _ProfileItem(title: "Nama", content: list[0]),
                            _ProfileItem(title: "Email", content: list[1]),
                            _ProfileItem(title: "NRP", content: list[2]),
                          ],
                        );
                      } else {
                        return const Text('data tidak ada');
                      }
                    }
                )
            ),
            const SizedBox(height: 56),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 72.0),
              child: OutlinedButton(
                  onPressed: () => {
                    Helper.deletePreference('data')
                        .then((value) => Get.offNamed(AppRoutes.splash))
                  },
                  style: OutlinedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.logout),
                      Text('Logout')
                    ],
                  )
              ),
            ),
          ],
        ),
      ),
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
