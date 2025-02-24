part of 'bottom_navigator_bar_cubit.dart';

@immutable
sealed class BottomNavigatorBarState {
  
}

final class BottomNavigatorBarInitial extends BottomNavigatorBarState {}

final class BottomNavigatorBarChanges extends BottomNavigatorBarState {
  final int index;
  final String item;
  BottomNavigatorBarChanges(this.index, this.item);

}
