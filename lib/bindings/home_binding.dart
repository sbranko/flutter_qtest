import 'package:get/get.dart';

import '../screens/home/home_controller.dart';
import '../services/network_manager.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..put(HomeController())
      ..put(GetXNetworkManager());
  }
}
