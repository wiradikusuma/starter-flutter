import 'package:flutter/material.dart';

import '../main.dart';
import '../routes.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          children: [
            const Text('Onboarding'),
            ElevatedButton(
              child: const Text('OK'),
              onPressed: () => _cta(context),
            ),
          ],
          mainAxisSize: MainAxisSize.min,
        ),
      ),
    );
  }

  void _cta(BuildContext context) {
    tempOnboarded = true;

    const IndexRoute().go(context);
  }
}
