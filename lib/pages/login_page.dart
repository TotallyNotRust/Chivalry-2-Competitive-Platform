import 'dart:io';

import 'package:c2cp/bloc/login/authentication_bloc.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    double? width;
    if (!kIsWeb) {
      if (Platform.isWindows || Platform.isLinux) {
        width = MediaQuery.of(context).size.width / 3;
      }
    }
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Image.asset("assets/logo_with_people.png"),
              ClayContainer(
                color: Theme.of(context).scaffoldBackgroundColor,
                height: 300,
                width: width,
                child: const DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                        child: TabBar(
                          tabs: [Tab(text: "Login"), Tab(text: "Signup"),],
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            LoginForm(),
                            SignupForm(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
    TextEditingController identityController =
        TextEditingController(text: "");
    TextEditingController passwordController =
        TextEditingController(text: "");

    return Padding(
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
    );
  }
}

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController(text: "");
    TextEditingController emailController = TextEditingController(text: "");
    TextEditingController passwordController = TextEditingController(text: "");

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text("Username"),
          CupertinoTextField(controller: usernameController),
          const Text("Email"),
          CupertinoTextField(controller: emailController),
          const Text("Password"),
          CupertinoTextField(
            controller: passwordController,
            obscureText: true,
          ),
          CupertinoButton(
            child: const Text("Login"),
            onPressed: () {
              BlocProvider.of<AuthenticationBloc>(context).add(SignupEvent(
                  username: usernameController.text,
                  email: emailController.text,
                  password: passwordController.text));
            },
          )
        ],
      ),
    );
  }
}
