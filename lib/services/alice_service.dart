import 'package:alice/alice.dart';
import 'package:get/get.dart';

class AliceService extends GetxService {
  /// ------------------------
  /// VARIABLES
  /// ------------------------

  late final Alice _alice;

  /// ------------------------
  /// GETTERS
  /// ------------------------

  Alice get alice => _alice;

  /// ------------------------
  /// SETTERS
  /// ------------------------

  set alice(Alice value) => _alice = value;

  /// ------------------------
  /// INIT
  /// ------------------------

  @override
  void onInit() {
    super.onInit();
    alice = Alice();
  }

  /// ------------------------
  /// METHODS
  /// ------------------------

  void showAliceInspector() => alice.showInspector();
}
