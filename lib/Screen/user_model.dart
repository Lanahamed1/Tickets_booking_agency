// user_model.dart

class UserModel {
  String firstName;
  String lastName;
  String username;
  String password;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.password,
  });
}

class User {
  final String username;
  final String password;

  User({required this.username, required this.password});
}
