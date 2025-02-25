part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchLoaded extends SearchState {
  // list of the products model
  // constructor 
  // return the list of the products
}


final class SearchError extends SearchState {
  final String message;
  SearchError(this.message);
}

