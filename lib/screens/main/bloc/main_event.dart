part of 'main_bloc.dart';

@immutable
abstract class MainEvent {}

class MainFetchEvent extends MainEvent {}

class MainRefreshEvent extends MainEvent {}

class MainErrorEvent extends MainEvent{}
