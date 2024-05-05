

import 'package:food_app/details/detail_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=> DetailController());
  }

}