import 'package:bloc/bloc.dart';

part 'my_state.dart';

class TextInputCubit extends Cubit<TextInputState> {
  TextInputCubit() : super(InitialState());

  void updateText(String newValue) => emit(TextChangedState(newValue));
}
