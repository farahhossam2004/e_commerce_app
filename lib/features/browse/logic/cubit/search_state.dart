part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchEmpty extends SearchState {}

final class SearchLoaded extends SearchState {
  final List<ProductModel> searchedProducts;

  SearchLoaded({required this.searchedProducts});
}

final class SearchError extends SearchState {
  final String message;
  SearchError(this.message);
}
