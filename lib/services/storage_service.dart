import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'logger_service.dart';

class StorageService extends GetxService {
  /// ------------------------
  /// LOGGER
  /// ------------------------

  final loggerService = Get.find<LoggerService>();

  /// ------------------------
  /// VARIABLES
  /// ------------------------

  late final GetStorage _storageBox;

  /// ------------------------
  /// GETTERS
  /// ------------------------

  GetStorage get storageBox => _storageBox;

  /// ------------------------
  /// SETTERS
  /// ------------------------

  set storageBox(GetStorage value) => _storageBox = value;

  /// ------------------------
  /// INIT
  /// ------------------------

  @override
  Future<void> onInit() async {
    super.onInit();
    storageBox = GetStorage();
  }

  /// ------------------------
  /// METHODS
  /// ------------------------

  /// Delete everything from Storage
  Future<void> deleteAll() async => storageBox.erase();

  /// Insert a value in Storage
  Future<void> insertValue({required String key, required String value}) async => storageBox.write(key, value);

  Future<void> insertBoolValue({required String key, required bool value}) async => storageBox.write(key, value);

  Future<void> insertList({required String key, required List<dynamic> value}) async => storageBox.write(key, value);

  /// Delete a value from Storage
  Future<void> deleteValue({required String key}) async => storageBox.remove(key);

  /// Get a value
  Future<dynamic> getValue({required String key}) async => storageBox.read(key);
}
