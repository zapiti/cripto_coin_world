import 'package:crypto_app/src/feature/home/provider/home_api.dart';
import 'package:crypto_app/src/feature/home/repository/home_repository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import 'controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => HomeRepository());
    Get.lazyPut(() => HomeAPI());
    Get.lazyPut(() => Dio());
  }
}
