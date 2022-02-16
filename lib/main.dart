import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_examples/NavObserver.dart';
import 'package:state_management_examples/analystic_bloc_observer.dart';
import 'package:state_management_examples/bloc_dir/my_cubit.dart';
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
    return BlocProvider<TextInputCubit>(
      create: (context) => TextInputCubit(),
      child: MaterialApp(
        navigatorObservers: [NavObserver()],
        home: Scaffold(
          appBar: AppBar(
            // title: MyTextTitle(),
            title: BlocBuilder<TextInputCubit, TextInputState>(
              builder: (context, state) => Text(state.theText),
            ),
          ),
          body: Column(
            children: [
              Level1(),
              MyNavButton(),
            ],
          ),
        ),
      ),
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
      child: Icon(Icons.arrow_forward),
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
      child: BlocBuilder<TextInputCubit, TextInputState>(
        builder: (context, state) => Text(state.theText),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(onChanged: (String newValue) {
      context.read<TextInputCubit>().updateText(newValue);
    });
  }
}
