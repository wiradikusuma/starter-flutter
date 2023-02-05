import 'strings.dart';

/// The translations for English (`en`).
class SEn extends S {
  SEn([String locale = 'en']) : super(locale);

  @override
  String greeting(String name) {
    return 'Hello $name!';
  }
}
