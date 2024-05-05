
import 'package:food_app/details/detail_binding.dart';
import 'package:food_app/home/home_binding.dart';
import 'package:food_app/root/root_binding.dart';
import 'package:food_app/root/root_view.dart';
import 'package:food_app/router/app_rout_name.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../details/detail_view.dart';
import '../home/home_view.dart';

class AppRoutPage{
  static final routes=[
    GetPage(
      name: AppRouterName.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRouterName.root,
      page: () => RootView(),
      binding: RootBinding(),
    ),
    GetPage(
      name: AppRouterName.detail,
      page: () =>DetailView(),
      binding:DetailBinding(),
    )
  ];
}