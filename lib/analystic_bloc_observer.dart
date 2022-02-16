import 'package:flutter_bloc/flutter_bloc.dart';

class AnalyticsBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('AnalyticsBlocObserver - onChange()...');
    print('Bloc Type: ${bloc.runtimeType}');
    print('Event: From ${change.currentState}');
    print('Event: To ${change.nextState}');
    print('-------------------------------------');
  }
}
