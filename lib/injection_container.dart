import 'package:get_it/get_it.dart';
import 'package:state_management_examples/analytics/analytics_engine.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  getIt.registerLazySingleton(() => AnalyticsEngine());
}
