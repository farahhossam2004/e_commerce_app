import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottom_navigator_bar_state.dart';

class BottomNavigatorBarCubit extends Cubit<BottomNavigatorBarState> {
  int index = 0;
  BottomNavigatorBarCubit() : super(BottomNavigatorBarChanges(0, 'Home'));

  void getNavBarItem(String navBarItem) {
    switch (navBarItem) {
      case 'Home':
        emit(BottomNavigatorBarChanges(0, 'Home'));
        break;
      case 'Browse':
        emit(BottomNavigatorBarChanges(1, 'Browse'));
        break;
      case 'Wishlist':
        emit(BottomNavigatorBarChanges(2, 'Wishlist'));
        break;
      case 'Cart':
        emit(BottomNavigatorBarChanges(3, 'Cart'));
        break;
      case 'Profile':
        emit(BottomNavigatorBarChanges(4, 'Profile'));
        break;
    }
  }
}
