import 'strings.dart';

/// The translations for Chinese (`zh`).
class SZh extends S {
  SZh([String locale = 'zh']) : super(locale);

  @override
  String greeting(String name) {
    return '你好 $name!';
  }
}
