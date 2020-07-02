part of 'model.dart';

class RegistrationData {
  String name;
  String email;
  String password;
  File profile;

  RegistrationData(
      {this.name = "", this.email = "", this.password = "", this.profile});
}
