import 'package:get/get.dart';

class Strings extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'helloWorld': 'Hello world!',
        },
        'de_DE': {
          'helloWorld': 'Hallo Welt!',
        },
      };
}
