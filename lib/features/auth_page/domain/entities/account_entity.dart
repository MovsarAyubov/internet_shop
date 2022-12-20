import 'dart:convert';

import 'package:equatable/equatable.dart';

class Account extends Equatable {
  final String userName;
  final String password;
  const Account({
    required this.userName,
    required this.password,
  });

  @override
  List<Object> get props => [userName, password];

  Account copyWith({
    String? userName,
    String? password,
  }) {
    return Account(
      userName: userName ?? this.userName,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'userName': userName});
    result.addAll({'password': password});

    return result;
  }

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      userName: map['userName'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Account.fromJson(String source) =>
      Account.fromMap(json.decode(source));

  @override
  String toString() => 'Account(userName: $userName, password: $password)';
}
