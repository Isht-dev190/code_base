abstract class NavigationEvent {}

class NavigateEvent extends NavigationEvent {
  final int index;
  NavigateEvent(this.index);
}


// NavigateEvent class basically just has an index property, and a constructor
