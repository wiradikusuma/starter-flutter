import 'package:mobx/mobx.dart';

part 'user.g.dart';

class User extends _User with _$User {
  User({
    required String code,
    String? name,
    String? email,
    String? mobile,
    required String country,
    required String locale,
    required String timezone,
  }) : super(
          code: code,
          name: name,
          email: email,
          mobile: mobile,
          country: country,
          locale: locale,
          timezone: timezone,
        );

  factory User.fromJson(Map<String, dynamic> json) => User(
        code: json['code'],
        name: json['name'],
        email: json['email'],
        mobile: json['mobile'],
        country: json['country'],
        locale: json['locale'],
        timezone: json['timezone'],
      );
}

abstract class _User with Store {
  final String code;

  @observable
  String? name;

  @observable
  String? email;

  @observable
  String? mobile;

  @observable
  String country;

  @observable
  String locale;

  @observable
  String timezone;

  _User({
    required this.code,
    this.name,
    this.email,
    this.mobile,
    required this.country,
    required this.locale,
    required this.timezone,
  });

  Map<String, dynamic> toJson() => {
        'code': code,
        'name': name,
        'email': email,
        'mobile': mobile,
        'country': country,
        'locale': locale,
        'timezone': timezone,
      };

  User clone({
    String? code,
    String? name,
    String? email,
    String? mobile,
    String? country,
    String? locale,
    String? timezone,
  }) =>
      User(
        code: code ?? this.code,
        name: name ?? this.name,
        email: email ?? this.email,
        mobile: mobile ?? this.mobile,
        country: country ?? this.country,
        locale: locale ?? this.locale,
        timezone: timezone ?? this.timezone,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is _User && runtimeType == other.runtimeType && code == other.code;

  @override
  int get hashCode => code.hashCode;
}
