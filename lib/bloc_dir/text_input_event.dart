part of 'text_input_bloc.dart';

@immutable
abstract class TextInputEvent {
  const TextInputEvent();
}

class TextInputEventOnChanged extends TextInputEvent {
  final String newValue;
  const TextInputEventOnChanged(this.newValue);
}

class TextInputEventOnSubmitted extends TextInputEvent {
  const TextInputEventOnSubmitted();
}
