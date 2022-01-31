import 'package:get/get.dart';
import 'package:logger/logger.dart';

class LoggerService extends GetxService {
  /// ------------------------
  /// VARIABLES
  /// ------------------------

  late final Logger _logger;

  /// ------------------------
  /// GETTERS
  /// ------------------------

  Logger get logger => _logger;

  /// ------------------------
  /// SETTERS
  /// ------------------------

  set logger(Logger value) => _logger = value;

  /// ------------------------
  /// INIT
  /// ------------------------

  @override
  void onInit() {
    super.onInit();
    logger = Logger();
  }
}
