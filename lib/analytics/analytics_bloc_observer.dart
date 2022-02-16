import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_examples/analytics/analytics_engine.dart';

import '../injection_container.dart';
import 'action_events.dart';

class AnalyticsBlocObserver extends BlocObserver {
  AnalyticsEngine _analyticsEngine = getIt<AnalyticsEngine>();

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);

    if (eventsToObserve.containsKey(event.runtimeType)) {
      Map<String, dynamic> data =
          eventsToObserve[event.runtimeType]?.call(event);
      _analyticsEngine.handleEvent(
        AnalyticsActionEvent(blocEvent: event.runtimeType, data: data),
      );
    }
  }
}
