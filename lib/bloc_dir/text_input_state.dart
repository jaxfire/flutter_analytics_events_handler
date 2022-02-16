part of 'text_input_bloc.dart';

@immutable
abstract class TextInputState {
  final String text;
  const TextInputState(this.text);
}

class TextInputStateInitial extends TextInputState {
  const TextInputStateInitial(String newValue) : super(newValue);
}

class TextInputStateChanged extends TextInputState {
  const TextInputStateChanged(String newValue) : super(newValue);
}

class TextInputStateSubmitted extends TextInputState {
  const TextInputStateSubmitted(String newValue) : super(newValue);
}
