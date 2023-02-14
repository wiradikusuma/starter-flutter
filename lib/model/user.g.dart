// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$User on _User, Store {
  late final _$nameAtom = Atom(name: '_User.name', context: context);

  @override
  String? get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String? value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$emailAtom = Atom(name: '_User.email', context: context);

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$mobileAtom = Atom(name: '_User.mobile', context: context);

  @override
  String? get mobile {
    _$mobileAtom.reportRead();
    return super.mobile;
  }

  @override
  set mobile(String? value) {
    _$mobileAtom.reportWrite(value, super.mobile, () {
      super.mobile = value;
    });
  }

  late final _$countryAtom = Atom(name: '_User.country', context: context);

  @override
  String get country {
    _$countryAtom.reportRead();
    return super.country;
  }

  @override
  set country(String value) {
    _$countryAtom.reportWrite(value, super.country, () {
      super.country = value;
    });
  }

  late final _$localeAtom = Atom(name: '_User.locale', context: context);

  @override
  String get locale {
    _$localeAtom.reportRead();
    return super.locale;
  }

  @override
  set locale(String value) {
    _$localeAtom.reportWrite(value, super.locale, () {
      super.locale = value;
    });
  }

  late final _$timezoneAtom = Atom(name: '_User.timezone', context: context);

  @override
  String get timezone {
    _$timezoneAtom.reportRead();
    return super.timezone;
  }

  @override
  set timezone(String value) {
    _$timezoneAtom.reportWrite(value, super.timezone, () {
      super.timezone = value;
    });
  }

  @override
  String toString() {
    return '''
name: ${name},
email: ${email},
mobile: ${mobile},
country: ${country},
locale: ${locale},
timezone: ${timezone}
    ''';
  }
}
