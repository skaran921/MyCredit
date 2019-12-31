import 'package:equatable/equatable.dart';
import 'package:ok_credit/home_page/index.dart';

abstract class HomePageEvent extends Equatable {
  HomePageEvent([List props = const <dynamic>[]]) : super(props);
  Future<HomePageState> applyAsync(
      HomePageState currentState, HomePageBloc bloc);
}

// ***********************************LoadingEvent****************************
class LoadingEvent extends HomePageEvent {
  @override
  String toString() => "LoadingEvent";

  @override
  Future<HomePageState> applyAsync(
      HomePageState currentState, HomePageBloc bloc) async {
    try {
      return InHomeState();
    } catch (_) {
      print(_?.toString());
      return ErrorHomeState(_?.toString());
    }
  }
}
// ***********************************LoadingEvent****************************
