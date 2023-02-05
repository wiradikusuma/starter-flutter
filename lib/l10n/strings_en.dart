import 'strings.dart';

/// The translations for English (`en`).
class SEn extends S {
  SEn([String locale = 'en']) : super(locale);

  @override
  String greeting(String name) {
    return 'Hello $name!';
  }

  @override
  String get detail_cta => 'Save';

  @override
  String get detail_cta_successful => 'Successfully saved!';

  @override
  String get index_login => 'Log In';

  @override
  String get index_logout => 'Log Out';

  @override
  String get login_cta => 'Log In';
}
