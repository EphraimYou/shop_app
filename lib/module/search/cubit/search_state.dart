part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class ChangeProductIndexState extends SearchState {}

final class ChangeSearchIconState extends SearchState {}

final class SearchLoadingDataState extends SearchState {}

final class SearchSuccessDataState extends SearchState {}

final class SearchErrorDatState extends SearchState {}
