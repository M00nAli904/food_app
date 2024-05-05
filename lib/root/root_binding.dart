
import 'package:food_app/root/root_controller.dart';
import 'package:get/get.dart';

class RootBinding extends Bindings{
  @override
  void dependencies() {
  Get.lazyPut(() => (RootController()));
  }

}