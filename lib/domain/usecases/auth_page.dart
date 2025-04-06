import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_authentication_app/presentation/pages/homepage.dart';
import 'package:firebase_authentication_app/presentation/pages/sign_in_screen.dart';

import '../../presentation/widgets/app_loading.dart';
import 'auth_service.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({
    super.key,
    this.pageIfNotConnected,
  });

  final Widget? pageIfNotConnected;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: authService,
      builder: (context, authService, child) {
        return StreamBuilder(
          stream: authService.authStateChanges,
          builder: (context, snapshot) {
            Widget widget;
            if (snapshot.connectionState == ConnectionState.waiting) {
              widget = const AppLoadingPage();
            } else if (snapshot.hasData) {
              widget =  Homepage();
            } else {
              widget = pageIfNotConnected ?? SignInScreen();
            }
            return widget;
          },
        );
      },
    );
  }
}
