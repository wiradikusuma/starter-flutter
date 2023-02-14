import 'package:app/model/user.dart';
import 'package:mobx/mobx.dart';

class UserService {
  var users = ObservableList()..add(User(code: '1', country: 'us', locale: 'en', timezone: 'America/Los_Angeles'));

  User get(String code) {
    return users.firstWhere((e) => e.code == code);
  }

  void update(User user) {
    users.removeWhere((e) => e.code == user.code);
    users.add(user);
  }
}
