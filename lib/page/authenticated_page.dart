import 'package:flutter/material.dart';

class AuthenticatedPage extends StatelessWidget {
  const AuthenticatedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authenticated'),
      ),
      backgroundColor: Colors.amber,
      body: const Center(
        child: Text('Authenticated'),
      ),
    );
  }
}
