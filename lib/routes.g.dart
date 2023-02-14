// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<GoRoute> get $appRoutes => [
      $indexRoute,
      $onboardingRoute,
    ];

GoRoute get $indexRoute => GoRouteData.$route(
      path: '/',
      factory: $IndexRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'authenticated',
          factory: $AuthenticatedRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'detail/:code',
          factory: $DetailRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'login',
          factory: $LoginRouteExtension._fromState,
        ),
      ],
    );

extension $IndexRouteExtension on IndexRoute {
  static IndexRoute _fromState(GoRouterState state) => const IndexRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $AuthenticatedRouteExtension on AuthenticatedRoute {
  static AuthenticatedRoute _fromState(GoRouterState state) =>
      const AuthenticatedRoute();

  String get location => GoRouteData.$location(
        '/authenticated',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $DetailRouteExtension on DetailRoute {
  static DetailRoute _fromState(GoRouterState state) => DetailRoute(
        code: state.params['code']!,
      );

  String get location => GoRouteData.$location(
        '/detail/${Uri.encodeComponent(code)}',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $LoginRouteExtension on LoginRoute {
  static LoginRoute _fromState(GoRouterState state) => const LoginRoute();

  String get location => GoRouteData.$location(
        '/login',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

GoRoute get $onboardingRoute => GoRouteData.$route(
      path: '/onboarding',
      factory: $OnboardingRouteExtension._fromState,
    );

extension $OnboardingRouteExtension on OnboardingRoute {
  static OnboardingRoute _fromState(GoRouterState state) =>
      const OnboardingRoute();

  String get location => GoRouteData.$location(
        '/onboarding',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}
