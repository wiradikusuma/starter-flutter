import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../l10n/strings.dart';
import '../main.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      backgroundColor: Colors.green,
      body: Center(
        child: ElevatedButton(
          child: Text(s.login_cta),
          onPressed: () => _cta(context),
        ),
      ),
    );
  }

  void _cta(BuildContext context) {
    tempLoggedIn = true;

    // Return to where we came from
    context.pop();
  }
}
