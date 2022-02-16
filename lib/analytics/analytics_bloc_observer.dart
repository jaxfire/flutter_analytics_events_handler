import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_examples/bloc_dir/text_input_bloc.dart';

import 'events_to_observe.dart';

class AnalyticsBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);

    if (eventsToObserve.containsKey(event.runtimeType)) {
      print('AnalyticsBlocObserver - onEvent()...');
      print('Type: ${bloc.runtimeType}');
      print('Event: ${event.runtimeType}');
      if (event is TextInputEventOnChanged) {
        print('Value: ${event.newValue}');
      }
      print('-------------------------------------');
    } else {
      print('Ignore');
    }
  }
}
