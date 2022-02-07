import 'package:get/get.dart';

import '../services/network_manager.dart';

class NetworkBinding extends Bindings {
  // dependence injection attach our class.
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(GetXNetworkManager());
  }
}
