import 'package:app/l10n/strings.dart';
import 'package:app/main.dart';
import 'package:app/model/user.dart';
import 'package:app/page/login_page.dart';
import 'package:app/service/user_service.dart';
import 'package:app/util/layout_utils.dart';
import 'package:app/util/routing_utils.dart';
import 'package:app/widget/support/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get_it/get_it.dart';

class DetailPage extends StatefulWidget {
  final String code;

  const DetailPage({super.key, required this.code});

  @override
  State<DetailPage> createState() => _State();
}

class _State extends State<DetailPage> {
  final _service = GetIt.I<UserService>();

  final _formKey = GlobalKey<FormState>();

  late final User _user;

  @override
  void initState() {
    super.initState();

    _user = _service.get(widget.code).clone();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail ${widget.code}. Logged in: $tempLoggedIn'),
      ),
      body: Form(
        child: Column(
          children: [
            Observer(
              builder: (context) => Text(s.detail_fyi(_user.name ?? '')),
            ),
            Input(
              initialValue: _user.name,
              keyboardType: TextInputType.name,
              label: s.detail_name,
              onChanged: (s) => _user.name = s,
              onFieldSubmitted: (s) => _cta(context),
              onSaved: (s) => _user.name = s!,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.go,
              validator: RequiredValidator(errorText: s.error_required(s.detail_name)),
            ).bPadded(),
            ElevatedButton(
              child: Text(s.detail_cta),
              onPressed: () => _cta(context),
            ),
          ],
        ),
        key: _formKey,
      ).padded(),
    );
  }

  void _cta(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      if (tempLoggedIn) {
        final s = S.of(context);

        _service.update(_user);

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
}
