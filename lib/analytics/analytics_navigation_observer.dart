import 'package:flutter/material.dart';

class AnalyticsNavigationObserver<R extends Route<dynamic>>
    extends RouteObserver<R> {
  @override
  void didPush(Route route, Route previousRoute) {
    print('didPush ${route.runtimeType}');
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route route, Route previousRoute) {
    print('didPop ${route.runtimeType}');
    super.didPop(route, previousRoute);
  }

  @override
  void didReplace({Route newRoute, Route oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }

  @override
  void didRemove(Route route, Route previousRoute) {
    super.didRemove(route, previousRoute);
  }

  @override
  void didStartUserGesture(Route route, Route previousRoute) {
    super.didStartUserGesture(route, previousRoute);
  }

  @override
  void didStopUserGesture() {
    super.didStopUserGesture();
  }
}
