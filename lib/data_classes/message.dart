// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:c2cp/bloc/login/authentication_bloc.dart';
import 'package:c2cp/data_classes/account.dart';

class Message {
  final Account from;
  final String message;
  Message({
    required this.from,
    required this.message,
  });

  Message copyWith({
    Account? from,
    String? message,
  }) {
    return Message(
      from: from ?? this.from,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'from': from.toMapWOEmail(),
      'message': message,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      from: Account.fromMap(map['from'] as Map<String,dynamic>),
      message: map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) => Message.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Message(from: $from, message: $message)';

  @override
  bool operator ==(covariant Message other) {
    if (identical(this, other)) return true;
  
    return 
      other.from == from &&
      other.message == message;
  }

  @override
  int get hashCode => from.hashCode ^ message.hashCode;

  factory Message.fromContext(BuildContext context, String text) {
    return Message(from: BlocProvider.of<AuthenticationBloc>(context).state.account!, message: text);
  }
}
