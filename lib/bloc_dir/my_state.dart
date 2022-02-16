part of 'my_cubit.dart';

class TextInputState {
  final theText;
  const TextInputState(this.theText);
}

class InitialState extends TextInputState {
  InitialState() : super('Initial Text');
}

class TextChangedState extends TextInputState {
  const TextChangedState(String theText) : super(theText);
}
