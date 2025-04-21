import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth/auth_provider.dart';
import 'login_screen.dart';

class AuthWrapper extends StatelessWidget {
  final Widget child;

  const AuthWrapper({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, _) {
        if (authProvider.user == null) {
          return const LoginScreen();
        }
        return child;
      },
    );
  }
}
