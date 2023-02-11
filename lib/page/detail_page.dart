import 'package:app/l10n/strings.dart';
import 'package:app/main.dart';
import 'package:app/page/login_page.dart';
import 'package:app/util/routing_utils.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String id;

  const DetailPage({super.key, required this.id});

  @override
  State<DetailPage> createState() => _State();
}

class _State extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail ${widget.id}. Logged in: $tempLoggedIn'),
      ),
      backgroundColor: Colors.red,
      body: Center(
        child: ElevatedButton(
          child: Text(s.detail_cta),
          onPressed: () => _cta(context),
        ),
      ),
    );
  }

  void _cta(BuildContext context) async {
    if (tempLoggedIn) {
      final s = S.of(context);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(s.detail_cta_successful),
      ));
    } else {
      // Not using go_router because it doesn't support waiting
      await context.pushWait(const LoginPage());
      // Force reload since we might be logged in by now
      setState(() {});

      if (context.mounted && tempLoggedIn) {
        _cta(context);
      }
    }
  }
}
