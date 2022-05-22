import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/LoginProvider.dart';
import 'widgets.dart';

enum ApplicationLoginState {
  loggedOut,
  emailAddress,
  register,
  password,
  loggedIn,
}

class Authentication extends StatelessWidget {
  const Authentication({
    required this.loginState,
    this.email,
    required this.startLoginFlow,
    required this.signInAnonymously,
    required this.signInWithGoogle,
    required this.signOut,
  });

  final ApplicationLoginState loginState;
  final String? email;
  final void Function() startLoginFlow;
  final void Function(
      void Function(Exception e) error
      ) signInAnonymously;
  final void Function(BuildContext context) signInWithGoogle;
  final void Function() signOut;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}