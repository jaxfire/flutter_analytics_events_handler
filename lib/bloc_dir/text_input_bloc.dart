import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'text_input_event.dart';
part 'text_input_state.dart';

class TextInputBloc extends Bloc<TextInputEvent, TextInputState> {
  static const String initialText = 'Initial Text';
  String text = initialText;

  TextInputBloc() : super(TextInputStateInitial(initialText)) {
    on<TextInputEvent>((event, emit) {
      switch (event.runtimeType) {
        case TextInputEventOnChanged:
          text = (event as TextInputEventOnChanged).newValue;
          emit(TextInputStateChanged(text));
          break;

        case TextInputEventOnSubmitted:
          print('Text was submitted. Do something with it.');
          text = initialText;
          emit(TextInputStateSubmitted(initialText));
          break;

        default:
          print('Event not recognised');
      }
    });
  }
}
