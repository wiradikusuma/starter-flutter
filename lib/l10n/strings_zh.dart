import 'strings.dart';

/// The translations for Chinese (`zh`).
class SZh extends S {
  SZh([String locale = 'zh']) : super(locale);

  @override
  String error_required(Object field) {
    return '$field is required';
  }

  @override
  String greeting(String name) {
    return '你好 $name!';
  }

  @override
  String detail_fyi(Object name) {
    return 'Hi $name, please edit your details below.';
  }

  @override
  String get detail_name => 'Name';

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
