import 'package:get/get.dart';
import 'package:qtest/services/network_manager.dart';

import '../screens/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..put(HomeController())
      ..put(GetXNetworkManager());
  }
}
