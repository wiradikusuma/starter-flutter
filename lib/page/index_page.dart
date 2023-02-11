import 'package:app/l10n/strings.dart';
import 'package:app/main.dart';
import 'package:app/routes.dart';
import 'package:app/util/layout_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _State();
}

class _State extends State<IndexPage> {
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      body: (context) => _body(context),
      destinations: const [
        NavigationDestination(icon: Icon(Icons.inbox), label: 'Inbox'),
        NavigationDestination(icon: Icon(Icons.article), label: 'Articles'),
      ],
      onSelectedIndexChange: (idx) => setState(() => _selectedIndex = idx),
      selectedIndex: _selectedIndex,
      smallBody: (_) => _body(context),
      smallSecondaryBody: AdaptiveScaffold.emptyBuilder,
      useDrawer: false,
    );
  }

  Widget _body(BuildContext context) {
    switch (_selectedIndex) {
      case 0:
        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text('Index. Logged in: $tempLoggedIn'),
                _buttons(context).bPadded(),
                _info(context),
                _localizedMessage(context).vPadded(),
                _alwaysInFrench(context),
              ],
            ),
          ),
        );
      case 1:
        return const Center(child: Text('Articles tab'));
      default:
        throw Exception('Undefined');
    }
  }

  Widget _buttons(BuildContext context) {
    final s = S.of(context);

    return Row(
      children: [
        if (!tempLoggedIn)
          ElevatedButton(
            child: Text(s.index_login),
            key: const Key('Login'),
            onPressed: () => _login(context),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          ).padded(8),
        ElevatedButton(
          child: const Text('Detail  1'),
          key: const Key('Detail 1'),
          onPressed: () => _goDetail1(context),
        ).padded(8),
        ElevatedButton(
          child: const Text('Authenticated'),
          key: const Key('Authenticated'),
          onPressed: () => _goAuthenticated(context),
        ).padded(8),
        if (tempLoggedIn)
          ElevatedButton(
            child: Text(s.index_logout),
            key: const Key('Logout'),
            onPressed: () => _logout(context),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          ).padded(8),
      ],
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    );
  }

  Widget _info(BuildContext context) {
    final locale = Localizations.localeOf(context);

    return Text(
      'Locale: $locale.\nChange between English/Chinese in phone settings.\nCalendar is always in French.\n',
      textAlign: TextAlign.center,
    );
  }

  Widget _localizedMessage(BuildContext context) {
    return Text(S.of(context).greeting('Flutter'));
  }

  Widget _alwaysInFrench(BuildContext context) {
    return Localizations.override(
      child: Builder(
        builder: (context) {
          return CalendarDatePicker(
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2100),
            onDateChanged: (value) {},
          );
        },
      ),
      context: context,
      locale: const Locale.fromSubtags(languageCode: 'fr'),
    );
  }

  void _login(BuildContext context) {
    // Using push() instead of go() because it's a peer page and we want Back button
    const LoginRoute().push(context);
  }

  void _goDetail1(BuildContext context) {
    const DetailRoute(id: '1').go(context);
  }

  _goAuthenticated(BuildContext context) {
    const AuthenticatedRoute().go(context);
  }

  void _logout(BuildContext context) {
    setState(() => tempLoggedIn = false);
  }
}
