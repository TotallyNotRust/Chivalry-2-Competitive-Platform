part of 'authentication_bloc.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first

@immutable
class AuthenticationState {
  final Account? account;
  AuthenticationState({
    this.account,
  });

  bool get isAuthenticated {
    return account != null;
  }

  AuthenticationState copyWith({
    Account? account,
  }) {
    return AuthenticationState(
      account: account ?? this.account,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'account': account?.toMap(),
    };
  }

  factory AuthenticationState.fromMap(Map<String, dynamic> map) {
    return AuthenticationState(
      account: Account.fromMap(map['account'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthenticationState.fromJson(String source) =>
      AuthenticationState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AuthenticationState(account: $account)';

  @override
  bool operator ==(covariant AuthenticationState other) {
    if (identical(this, other)) return true;

    return other.account == account;
  }

  @override
  int get hashCode => account.hashCode;
}
