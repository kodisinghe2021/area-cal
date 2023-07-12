part of 'app_pages.dart';

abstract class Routes {
  Routes_();

  static const MAIN = Paths.MAIN;
  static const HISTORY = Paths.HISTORY;
}

abstract class Paths {
  Paths_();

  static const MAIN = '/main';
  static const HISTORY = '/history';
}
