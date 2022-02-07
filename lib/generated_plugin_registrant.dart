//
// Generated file. Do not edit.
//

// ignore_for_file: directives_ordering
// ignore_for_file: lines_longer_than_80_chars

import 'package:audioplayers/web/audioplayers_web.dart';
import 'package:connectivity_plus_web/connectivity_plus_web.dart';
import 'package:device_info_plus_web/device_info_plus_web.dart';
import 'package:location_web/location_web.dart';
import 'package:network_info_plus_web/network_info_plus_web.dart';
import 'package:package_info_plus_web/package_info_plus_web.dart';
import 'package:sensors_plus_web/sensors_plus_web.dart';
import 'package:url_launcher_web/url_launcher_web.dart';
import 'package:wakelock_web/wakelock_web.dart';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

// ignore: public_member_api_docs
void registerPlugins(Registrar registrar) {
  AudioplayersPlugin.registerWith(registrar);
  ConnectivityPlusPlugin.registerWith(registrar);
  DeviceInfoPlusPlugin.registerWith(registrar);
  LocationWebPlugin.registerWith(registrar);
  NetworkInfoPlusPlugin.registerWith(registrar);
  PackageInfoPlugin.registerWith(registrar);
  SensorsPlugin.registerWith(registrar);
  UrlLauncherPlugin.registerWith(registrar);
  WakelockWeb.registerWith(registrar);
  registrar.registerMessageHandler();
}
