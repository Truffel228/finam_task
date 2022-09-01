part of 'main_bloc.dart';

@immutable
class MainState {
  const MainState(this.mainPageState);
  final MainPageState mainPageState;
}

class MainErrorState extends MainState{
  const MainErrorState(super.mainPageState);
}
