import 'package:flutter/material.dart';

import '../injection_container.dart';
import 'analytics_engine.dart';

class AnalyticsNavigationObserver<R extends Route<dynamic>>
    extends RouteObserver<R> {
  AnalyticsEngine _analyticsEngine = getIt<AnalyticsEngine>();

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _analyticsEngine.handleEvent(
      AnalyticsViewEvent(
        to: route.runtimeType,
        from: previousRoute?.runtimeType,
      ),
    );
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _analyticsEngine.handleEvent(
      AnalyticsViewEvent(
          to: route.runtimeType, from: previousRoute?.runtimeType),
    );
    super.didPop(route, previousRoute);
  }

/*
  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
  }

  @override
  void didStartUserGesture(
      Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didStartUserGesture(route, previousRoute);
  }

  @override
  void didStopUserGesture() {
    super.didStopUserGesture();
  }
  */
}
