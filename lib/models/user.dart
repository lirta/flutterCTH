part of 'model.dart';

class User extends Equatable {
  final String id;
  final String email;
  final String name;
  final String profile;
  final int balance;

  User(this.id, this.email, {this.name, this.profile, this.balance});

  User copyWith({String name, String profile, int balance}) =>
      User(this.id, this.email,
          name: name ?? this.name,
          profile: profile ?? this.profile,
          balance: balance ?? this.balance);
  @override
  String toString() {
    // TODO: implement toString
    return "[$id] - $name, $email";
  }

  @override
  List<Object> get props => [id, email, name, profile, balance];
}
