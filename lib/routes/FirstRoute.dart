import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_examples/bloc_dir/text_input_bloc.dart';

import 'SecondRoute.dart';

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyTextField(),
        SomeRandomTextWidget(),
        SubmitButton(),
        NavigateButton(),
      ],
    );
  }
}

class MyTextField extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
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

class SomeRandomTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(context.select((TextInputBloc bloc) => bloc.state.text)),
    );
  }
}

class SubmitButton extends StatelessWidget {
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

class NavigateButton extends StatelessWidget {
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
