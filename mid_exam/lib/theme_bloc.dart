import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mid_exam/theme_event.dart';
import 'package:mid_exam/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(isDark: false, themeData: _lightTheme)) {
    on<ToggleThemeEvent>((event, emit) {
      if (state.isDark) {
        emit(ThemeState(isDark: false, themeData: _lightTheme));
      } else {
        emit(ThemeState(isDark: true, themeData: _darkTheme));
      }
    });
  }


// Above themeBloc has a constructor and when toggle state is given, it changes the state to light if it was dark before and vice versa

  static final ThemeData _lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
    ),
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 2,
      shadowColor: Colors.grey.withOpacity(0.3),
    ),
    iconTheme: IconThemeData(color: Colors.black54),
    bottomAppBarTheme: BottomAppBarTheme(
      color: Colors.white,
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(color: Colors.black87),
    ),
  );



// Above is the light theme with white background and black text color, here we are defining the light theme elements

  static final ThemeData _darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Color(0xFF0A1929),
    scaffoldBackgroundColor: Color(0xFF0A1929),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF0A1929),
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    cardTheme: CardTheme(
      color: Color(0xFF162735),
      elevation: 2,
      shadowColor: Colors.black.withOpacity(0.3),
    ),
    iconTheme: IconThemeData(color: Colors.white70),
    bottomAppBarTheme: BottomAppBarTheme(
      color: Color(0xFF0A1929),
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(color: Colors.white70),
    ),
  );
}

// above we have the dark theme with dark background and white text color, here we are defining the dark theme elements