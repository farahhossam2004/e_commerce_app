part of 'wishlist_cubit.dart';

@immutable
sealed class WishlistState {}

final class WishlistInitial extends WishlistState {}

final class WishListLoading extends WishlistState {}

final class WishListLoaded extends WishlistState{}

final class WishlistError extends WishlistState {
  final String message;
  WishlistError({required this.message});
}

class WishlistUpdated extends WishlistState {}