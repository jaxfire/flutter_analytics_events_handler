import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:state_management_examples/analytics/analytics_bloc_observer.dart';
import 'package:state_management_examples/analytics/analytics_navigation_observer.dart';
import 'package:state_management_examples/bloc_dir/text_input_bloc.dart';
import 'package:state_management_examples/routes/FirstRoute.dart';

import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initDependencies();
  await GetIt.instance.allReady();
  BlocOverrides.runZoned(
    () => runApp(MyApp()),
    blocObserver: AnalyticsBlocObserver(),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TextInputBloc>(
      create: (context) => TextInputBloc(),
      child: MaterialApp(
        navigatorObservers: [AnalyticsNavigationObserver()],
        home: Scaffold(
          appBar: AppBar(
            title: TitleText(),
          ),
          body: FirstRoute(),
        ),
      ),
    );
  }
}

class TitleText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(context.select((TextInputBloc bloc) => bloc.state.text));
  }
}
