import 'package:clase_4_diplomado/repository/user_repository.dart';
import 'package:flutter/cupertino.dart';

import '../domain/user.dart';

class UserViewModel with ChangeNotifier {
  final UserRepository repository;

  late User _user;

  UserViewModel({required this.repository}) {
    _user = repository.getUser();
  }

  String get name => _user.name;

  void changeName(String name) {
    repository.updateUser(name);
    _user = repository.getUser();
    notifyListeners();
  }
}
