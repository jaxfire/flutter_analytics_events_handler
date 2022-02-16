import 'package:state_management_examples/bloc_dir/text_input_bloc.dart';

const Map<Type, Function?> eventsToObserve = {
  TextInputEventOnSubmitted: handleTextInputEventOnSubmitted,
};

Map<String, dynamic> handleTextInputEventOnSubmitted(
    TextInputEventOnSubmitted event) {
  return {'SubmittedText': event.submittedText};
}
