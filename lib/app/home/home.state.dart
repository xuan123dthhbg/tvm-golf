part of 'home.cubit.dart';

@immutable
abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  const HomeInitial();

  @override
  List<Object> get props => [];
}

class Loading extends HomeState {
  const Loading();

  @override
  List<Object> get props => [];
}

class HavingNotification extends HomeState {
  const HavingNotification();

  @override
  List<Object> get props => [];
}

class HavingMess extends HomeState {
  const HavingMess();

  @override
  List<Object> get props => [];
}

class NetworkError extends HomeState {
  const NetworkError();

  @override
  List<Object> get props => [];
}
