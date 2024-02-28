import 'dart:io';

import 'package:c2cp/bloc/login/authentication_bloc.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Image.asset("assets/logo_with_people.png"),
              const LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double? width;
    if (!kIsWeb) {
      if (Platform.isWindows || Platform.isLinux) {
        width = MediaQuery.of(context).size.width / 3;
      }
    }

    TextEditingController identityController =
        TextEditingController(text: "Person3");
    TextEditingController passwordController =
        TextEditingController(text: "TestPass");

    return ClayContainer(
      color: Theme.of(context).scaffoldBackgroundColor,
      width: width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text("Email or Username"),
            CupertinoTextField(controller: identityController),
            const Text("Password"),
            CupertinoTextField(
              controller: passwordController,
              obscureText: true,
            ),
            CupertinoButton(
              child: const Text("Login"),
              onPressed: () {
                BlocProvider.of<AuthenticationBloc>(context).add(LoginEvent(
                    identifier: identityController.text,
                    password: passwordController.text));
              },
            )
          ],
        ),
      ),
    );
  }
}
