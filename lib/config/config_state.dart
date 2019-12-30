import 'package:meta/meta.dart';

import 'package:equatable/equatable.dart';

abstract class ConfigState extends Equatable {
  ConfigState([List props = const <dynamic>[]]) : super(props);
  ConfigState getStateCopy();
}

// ********************************************UnConfigState************************
class UnConfigState extends ConfigState {
  @override
  String toString() => "UnConfigState";

  @override
  ConfigState getStateCopy() {
    return UnConfigState();
  }
}
// ********************************************UnConfigState************************

// ********************************************InConfigState************************
class InConfigState extends ConfigState {
  @override
  String toString() => "InConfigState";

  @override
  ConfigState getStateCopy() {
    return InConfigState();
  }
}
// ********************************************InConfigState************************

// ********************************************ErrorConfigState************************
class ErrorConfigState extends ConfigState {
  final String errorMessage;

  ErrorConfigState(this.errorMessage);
  @override
  String toString() => "ErrorConfigState";

  @override
  ConfigState getStateCopy() {
    return ErrorConfigState(this.errorMessage);
  }
}
// ********************************************ErrorConfigState************************
