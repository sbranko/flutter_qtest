import 'package:get/get.dart';
import 'package:qtest/bindings/network_binding.dart';

import '../services/dio_service.dart';
import '../services/storage_service.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..put(NetworkBinding())
      ..put(StorageService())
      ..put(DioService());
  }
}
