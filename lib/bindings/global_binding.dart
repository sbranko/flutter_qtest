import 'package:get/get.dart';

import '../services/dio_service.dart';
import '../services/storage_service.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..put(StorageService())
      ..put(DioService());
  }
}
