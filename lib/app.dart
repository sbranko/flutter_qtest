import 'package:flutter/material.dart';

import 'flavors.dart';
import 'pages/my_home_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: F.title,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: _flavorBanner(
          child: MyHomePage(),
        ),
      );

  Widget _flavorBanner({
    required Widget child,
    bool show = true,
  }) =>
      show
          ? Banner(
              location: BannerLocation.topStart,
              message: F.name,
              color: Colors.green.withOpacity(0.6),
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w700, fontSize: 12, letterSpacing: 1),
              textDirection: TextDirection.ltr,
              child: child,
            )
          : Container(
              child: child,
            );
}
