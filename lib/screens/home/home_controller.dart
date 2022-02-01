import 'package:get/get.dart';
import 'package:qtest/models/comment/comment.dart';
import 'package:qtest/services/dio_service.dart';
import 'package:qtest/services/storage_service.dart';

import '../../models/car/car.dart';
import '../../services/logger_service.dart';

class HomeController extends GetxController with StateMixin<List<Comment>> {
  /// ------------------------
  /// LOGGER
  /// ------------------------

  final loggerService = Get.find<LoggerService>();
  final dioService = Get.find<DioService>();
  final storageService = Get.find<StorageService>();

  /// ------------------------
  /// VARIABLES
  /// ------------------------

  final RxList<Car> _cars = <Car>[].obs;
  final RxList<Comment> _comments = <Comment>[].obs;

  /// ------------------------
  /// GETTERS
  /// ------------------------

  List<Car> get cars => _cars;
  List<Comment> get comments => _comments;

  /// ------------------------
  /// SETTERS
  /// ------------------------

  set cars(List<Car> value) => _cars.assignAll(value);
  set comments(List<Comment> value) => _comments.assignAll(value);

  /// ------------------------
  /// INIT
  /// ------------------------

  @override
  Future<void> onInit() async {
    super.onInit();
    // getComments(0, 20);
    change(null, status: RxStatus.empty());
  }

  /// ------------------------
  /// METHODS
  /// ------------------------

  /// Wait for some time (simulate an API call) and return cars
  /// Also set the state to 'success' so we can easily show it in the UI
  Future<void> fetchCars() async {
    try {
      change(null, status: RxStatus.loading());
      await Future.delayed(const Duration(milliseconds: 3600));
      cars = [
        Car(
          color: 'red',
          maker: 'BMW',
          model: '5 series',
          topSpeed: 250,
        ),
        Car(
          color: 'yellow',
          maker: 'Volkswagen',
          model: 'Golf',
          topSpeed: 190,
        ),
        Car(
          color: 'blue',
          maker: 'Lada',
          model: 'Niva',
          topSpeed: 175,
        ),
      ];
      change(null, status: RxStatus.success());
    } catch (e) {
      loggerService.logger.e(e.toString());
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  Future<void> getComments(int offset, int limit) async {
    change(null, status: RxStatus.loading());
    try {
      final response = await dioService.request(
        url: 'comments?_start=$offset&_limit=$limit',
        method: HttpMethod.get,
        onSuccess: (response) {
          final listLeaderboard = response as List<dynamic>;
          return listLeaderboard.map((e) => Comment.fromJson(e)).toList();
        },
      );

      await response.when(
        success: (commentResponse) async {
          loggerService.logger.i(commentResponse);
          comments = commentResponse;
          change(commentResponse, status: RxStatus.success());
        },
        error: (error) {
          loggerService.logger.e(error.toString());

          change(null, status: RxStatus.error(error.message));
        },
        empty: () {
          change(null, status: RxStatus.empty());
        },
      );
    } catch (e) {
      loggerService.logger.e(e.toString());
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
