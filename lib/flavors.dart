enum Flavor {
  DEV,
  LIVE,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.DEV:
        return 'Dev App';
      case Flavor.LIVE:
        return 'Live App';
      default:
        return 'title';
    }
  }

}
