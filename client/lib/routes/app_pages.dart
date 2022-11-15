import 'package:get/get.dart';

import '../pages/splash/splash.dart';
import '../pages/login/login.dart';
import '../pages/register/register.dart';
import '../pages/profile/profile.dart';
import '../pages/home/home.dart';
import '../pages/event/event.dart';
import '../pages/detail/detail.dart';
import '../pages/add/add.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splash,
      binding: SplashBinding(),
      page: () => const SplashPage(),
    ),

    GetPage(
      name: AppRoutes.register,
      binding: RegisterBinding(),
      page: () => const RegisterPage(),
    ),

    GetPage(
      name: AppRoutes.profile,
      binding: ProfileBinding(),
      page: () => const ProfilePage(),
    ),

    GetPage(
      name: AppRoutes.login,
      binding: LoginBinding(),
      page: () => const LoginPage(),
    ),

    GetPage(
      name: AppRoutes.home,
      binding: HomeBinding(),
      page: () => const HomePage(),
    ),

    GetPage(
      name: AppRoutes.event,
      binding: EventBinding(),
      page: () => const EventPage(),
    ),

    GetPage(
      name: AppRoutes.detail,
      binding: DetailBinding(),
      page: () => const DetailPage(),
    ),

    GetPage(
      name: AppRoutes.add,
      binding: AddBinding(),
      page: () => const AddPage(),
    ),

  ];
}