// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {}

class LoginEvent extends AuthenticationEvent {
  final String identifier;
  final String password;
  LoginEvent({
    required this.identifier,
    required this.password,
  });
}
class SignupEvent extends AuthenticationEvent {
  final String email;
  final String username;
  final String password;
  SignupEvent({
    required this.email,
    required this.username,
    required this.password,
  });
}
