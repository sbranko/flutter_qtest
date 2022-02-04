import 'package:get/get.dart';

import '../services/dio_service.dart';
import '../services/storage_service.dart';
import 'network_binding.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..put(NetworkBinding())
      ..put(StorageService())
      ..put(DioService());
  }
}
