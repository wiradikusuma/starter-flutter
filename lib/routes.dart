import 'dart:async';

import 'package:app/main.dart';
import 'package:app/page/authenticated_page.dart';
import 'package:app/page/detail_page.dart';
import 'package:app/page/index_page.dart';
import 'package:app/page/login_page.dart';
import 'package:app/page/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'routes.g.dart';

/// Base class for route that requires authenticated user.
@immutable
abstract class _AuthenticatedRoute extends GoRouteData {
  const _AuthenticatedRoute();

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    if (tempLoggedIn) {
      return null;
    } else {
      return const LoginRoute().location;
    }
  }
}

//region Index
@TypedGoRoute<IndexRoute>(
  path: '/',
  routes: [
    TypedGoRoute<AuthenticatedRoute>(
      path: 'authenticated',
    ),
    TypedGoRoute<DetailRoute>(
      path: 'detail/:code',
    ),
    TypedGoRoute<LoginRoute>(
      path: 'login',
    ),
  ],
)
@immutable
class IndexRoute extends GoRouteData {
  const IndexRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const IndexPage();

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    if (tempOnboarded) {
      return null;
    } else {
      return const OnboardingRoute().location;
    }
  }
}

@immutable
class AuthenticatedRoute extends _AuthenticatedRoute {
  const AuthenticatedRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const AuthenticatedPage();
}

@immutable
class DetailRoute extends GoRouteData {
  final String code;

  const DetailRoute({required this.code});

  @override
  Widget build(BuildContext context, GoRouterState state) => DetailPage(code: code);
}

@immutable
class LoginRoute extends GoRouteData {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const LoginPage();
}
//endregion

//region Onboarding
@TypedGoRoute<OnboardingRoute>(
  path: '/onboarding',
)
@immutable
class OnboardingRoute extends GoRouteData {
  const OnboardingRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const OnboardingPage();
}
//endregion
