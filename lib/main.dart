import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'bindings/global_binding.dart';
import 'pages.dart';
import 'screens/home/home_screen.dart';
import 'services/alice_service.dart';
import 'services/logger_service.dart';
import 'strings.dart';
import 'theme.dart';

Future<void> main() async {
  await GetStorage.init();
  Get
    ..put(AliceService())
    ..put(LoggerService());
  runApp(QApp());
}

class QApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ScreenUtilInit(
        builder: () => GetMaterialApp(
          title: 'Qapp',
          navigatorKey: Get.find<AliceService>().alice.getNavigatorKey(),
          theme: theme,
          initialBinding: GlobalBinding(),
          initialRoute: HomeScreen.routeName,
          translations: Strings(),
          locale: Get.deviceLocale,
          fallbackLocale: const Locale('en_US'),
          defaultTransition: Transition.fadeIn,
          getPages: pages,
        ),
      );
}
