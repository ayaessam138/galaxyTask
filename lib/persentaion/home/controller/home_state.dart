part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class Loading extends HomeState {}

final class Success extends HomeState {}

final class Fail extends HomeState {
  final String message;

  Fail({required this.message});
}

class SearchModeToggled extends HomeState {
  final bool isSearching;
  SearchModeToggled(this.isSearching);
}