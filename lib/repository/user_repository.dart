import '../domain/user.dart';

abstract class UserRepository {
  User getUser();

  void updateUser(String newName);
}

class FakeUserRepository implements UserRepository {
  User _user = User('Invitado');

  @override
  User getUser() {
    return _user;
  }

  @override
  void updateUser(String newName) {
    _user = User(newName);
  }
}
