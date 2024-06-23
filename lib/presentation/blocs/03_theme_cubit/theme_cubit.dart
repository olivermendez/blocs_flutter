import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit({bool darkmode = false}) : super(ThemeState(isDarkmode: darkmode));

  void toggleTheme() {
    emit(ThemeState(isDarkmode: !state.isDarkmode));
  }

  void setDarkMode() {
    emit(const ThemeState(isDarkmode: true));
  }

  void setLigthMode() {
    emit(const ThemeState(isDarkmode: false));
  }
}
