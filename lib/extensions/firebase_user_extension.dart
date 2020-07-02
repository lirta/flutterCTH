part of 'extensions.dart';

extension FirebaseUserExtension on FirebaseUser {
  User converToUser({String name = "No Name", int balance = 10000}) =>
      User(this.uid, this.email, name: name, balance: balance);
  Future<User> fromFireStrore() async => await UserServices.getUser(this.uid);
}
