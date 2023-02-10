import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:starter_flutter/env.dart';
import 'package:starter_flutter/l10n/strings.dart';
import 'package:starter_flutter/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late final S s;

  setUpAll(() async {
    s = await S.delegate.load(const Locale('en'));
    app.temp = Env(server: 'TESTING');
  });

  setUp(() {
    app.tempLoggedIn = false;
    app.tempOnboarded = false;
  });

  group('Login page', () {
    testWidgets(
        'GIVEN user is NOT logged in '
        'WHEN user taps Log In '
        'THEN user is logged in ', (tester) async {
      await _boot(tester);

      await tester.tap(find.byKey(const Key('Login')));
      await tester.pumpAndSettle();
      await _logIn(tester);

      // Upon successful login, index page is shown
      expect(find.text('Index. Logged in: true'), findsOneWidget);
    });

    testWidgets(
        'GIVEN user is NOT logged in '
        'WHEN user taps Back '
        'THEN user is NOT logged in ', (tester) async {
      await _boot(tester);

      await tester.tap(find.byKey(const Key('Login')));
      await tester.pumpAndSettle();
      await _back(tester);

      // Upon successful login, index page is shown
      expect(find.text('Index. Logged in: false'), findsOneWidget);
    });
  });

  group('Detail page', () {
    testWidgets(
        'GIVEN user is NOT logged in '
        'WHEN user taps Save '
        'THEN user is presented with the Login page '
        'THEN after user is logged in, save is resumed ', (tester) async {
      await _boot(tester);

      await tester.tap(find.byKey(const Key('Detail 1')));
      await tester.pumpAndSettle();
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      await _logIn(tester);

      expect(find.text(s.detail_cta_successful), findsOneWidget);
    });
  });

  group('Tabs', () {
    testWidgets(
        'GIVEN user is on the Index page '
        'WHEN user taps Articles in the navigation '
        'THEN user is presented with the Articles tab ', (tester) async {
      await _boot(tester);

      await tester.tap(find.text('Articles'));
      await tester.pumpAndSettle();

      expect(find.text('Articles tab'), findsOneWidget);
    });
  });
}

Future<void> _boot(WidgetTester tester) async {
  await tester.pumpWidget(const app.MyApp());
  await _onboarding(tester);
}

Future<void> _onboarding(WidgetTester tester) async {
  await tester.tap(find.byType(ElevatedButton));
  await tester.pumpAndSettle();
}

Future<void> _logIn(WidgetTester tester) async {
  await tester.tap(find.byType(ElevatedButton));
  await tester.pumpAndSettle();
}

Future<void> _back(WidgetTester tester) async {
  final dynamic state = tester.state(find.byType(Navigator));

  state.pop();

  await tester.pump();
}
