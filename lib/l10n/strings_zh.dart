import 'strings.dart';

/// The translations for Chinese (`zh`).
class SZh extends S {
  SZh([String locale = 'zh']) : super(locale);

  @override
  String greeting(String name) {
    return '你好 $name!';
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
