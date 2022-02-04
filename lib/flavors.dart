enum Flavor {
  dev,
  live,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Dev App';
      case Flavor.live:
        return 'Live App';
      default:
        return 'title';
    }
  }
}
