part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeUserLoading extends HomeState {}

final class HomeUserLoaded extends HomeState {}

final class HomeUserError extends HomeState {
  final String message;

  HomeUserError(this.message);
}
