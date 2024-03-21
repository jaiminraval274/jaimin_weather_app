/**
 * Created by Jaimin on 21/03/24.
 */


import 'package:get/get.dart';

import '../controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
