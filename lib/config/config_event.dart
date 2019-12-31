import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:ok_credit/config/index.dart';

@immutable
abstract class ConfigEvent extends Equatable {
  ConfigEvent([List props = const <dynamic>[]]) : super(props);
  Future<ConfigState> applyAsync({ConfigState currentState, ConfigBloc bloc});
}

// *****************************************LoadEvent*******************
class LoadConfigEvent extends ConfigEvent {
  @override
  Future<ConfigState> applyAsync(
      {ConfigState currentState, ConfigBloc bloc}) async {
    try {
      await Future.delayed(Duration(seconds: 2));
      return InConfigState();
    } catch (_, stackTrace) {
      print('$_ $stackTrace');
      return ErrorConfigState(_?.toString());
    }
  }
}
// *****************************************LoadEvent*******************

// ****************************************DarkModeEvent****************************
class SetDarkMode extends ConfigEvent {
  final bool darkMode;

  SetDarkMode(this.darkMode);
  @override
  Future<ConfigState> applyAsync(
      {ConfigState currentState, ConfigBloc bloc}) async {
    try {
      bloc.isDarkModeOn = darkMode;
      return InConfigState();
    } catch (_, stacktrace) {
      print('$_ $stacktrace');
      return ErrorConfigState(_?.toString());
    }
  }
}
// ****************************************DarkModeEvent****************************

// *************************************SetLoadingEvent*******************************
class SetLoadingEvent extends ConfigEvent {
  final bool isLoading;

  SetLoadingEvent(this.isLoading);
  @override
  String toString() => "SetLoadingEvent";

  @override
  Future<ConfigState> applyAsync(
      {ConfigState currentState, ConfigBloc bloc}) async {
    try {
      bloc.isLoading = this.isLoading;
      return InConfigState();
    } catch (_) {
      return ErrorConfigState(_?.toString());
    }
  }
}
// *************************************SetLoadingEvent*******************************
