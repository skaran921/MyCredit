import 'package:equatable/equatable.dart';

abstract class HomePageState extends Equatable {
  HomePageState([List props = const <dynamic>[]]) : super(props);
  HomePageState getStateCopy();
}

// *********************************UnHomeState*******************
class UnHomeState extends HomePageState {
  @override
  String toString() => "UnHomeState";

  @override
  HomePageState getStateCopy() {
    return UnHomeState();
  }
}
// *********************************UnHomeState*******************

// *********************************InHomeState*******************
class InHomeState extends HomePageState {
  @override
  String toString() => "UnHomeState";

  @override
  HomePageState getStateCopy() {
    return InHomeState();
  }
}
// *********************************UnHomeState*******************

// *********************************ErrorHomeState*******************
class ErrorHomeState extends HomePageState {
  final String errorMessage;

  ErrorHomeState(this.errorMessage);
  @override
  String toString() => "UnHomeState";

  @override
  HomePageState getStateCopy() {
    return ErrorHomeState(errorMessage);
  }
}
// *********************************UnHomeState*******************
