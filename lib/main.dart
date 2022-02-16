import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_examples/analytics/analytics_bloc_observer.dart';
import 'package:state_management_examples/analytics/analytics_navigation_observer.dart';
import 'package:state_management_examples/bloc_dir/text_input_bloc.dart';
import 'package:state_management_examples/routes/SecondRoute.dart';

void main() {
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
            title: NewWidget(),
          ),
          body: Column(
            children: [
              Level1(),
              MySubmitButton(),
              MyNavButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(context.select((TextInputBloc bloc) => bloc.state.text));
  }
}

class MySubmitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<TextInputBloc>().add(TextInputEventOnSubmitted());
      },
      child: Text('Submit'),
    );
  }
}

class MyNavButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SecondRoute()),
        );
      },
      child: Text('Next Screen'),
    );
  }
}

class Level1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Level2(),
    );
  }
}

class Level2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyTextField(),
        Level3(),
      ],
    );
  }
}

class Level3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(context.select((TextInputBloc bloc) => bloc.state.text)),
    );
  }
}

class MyTextField extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: Wrap in BlocBuilder and listen for TextSubmitted state
    return BlocListener<TextInputBloc, TextInputState>(
      listener: (context, state) {
        if (state is TextInputStateSubmitted) {
          _controller.clear();
        }
      },
      child: TextField(
        textAlign: TextAlign.center,
        controller: _controller,
        onChanged: (String newValue) {
          context.read<TextInputBloc>().add(
                TextInputEventOnChanged(newValue),
              );
        },
        onSubmitted: (String value) {
          context.read<TextInputBloc>().add(TextInputEventOnSubmitted());
        },
      ),
    );
  }
}
