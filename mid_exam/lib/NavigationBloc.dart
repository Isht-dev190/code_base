import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mid_exam/NavigationEvent.dart';
import 'package:mid_exam/NavigationState.dart';


class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationState(currentIndex: 0)) {
    on<NavigateEvent>((event, emit) {
      emit(NavigationState(currentIndex: event.index));
    });
  }
}

// navigation bloc just checks for current index, defaults to 0 and checks for the index in the event

