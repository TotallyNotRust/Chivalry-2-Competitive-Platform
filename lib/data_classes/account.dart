// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Account {
  final int id;
  final String username;
  // Nullable, since we will send other users in lobby as account, and having email for them is a gdpr case waiting to happen.
  final String? email; 
  Account({
    required this.id,
    required this.username,
    required this.email,
  });

  Account copyWith({
    int? id,
    String? username,
    String? email,
  }) {
    return Account(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'email': email,
    };
  }
  Map<String, dynamic> toMapWOEmail() {
    return <String, dynamic>{
      'id': id,
      'username': username,
    };
  }
  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      id: map['id'] as int,
      username: map['username'] as String,
      email: map['email'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory Account.fromJson(String source) => Account.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Account(id: $id, username: $username, email: $email)';

  @override
  bool operator ==(covariant Account other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.username == username &&
      other.email == email;
  }

  @override
  int get hashCode => id.hashCode ^ username.hashCode ^ email.hashCode;
}
