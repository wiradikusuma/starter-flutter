import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'main.dart';
import 'page/authenticated_page.dart';
import 'page/detail_page.dart';
import 'page/index_page.dart';
import 'page/login_page.dart';
import 'page/onboarding_page.dart';

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
      path: 'detail/:id',
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
  final String id;

  const DetailRoute({required this.id});

  @override
  Widget build(BuildContext context, GoRouterState state) => DetailPage(id: id);
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
