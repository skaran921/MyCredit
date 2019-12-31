import 'package:bloc/bloc.dart';
import 'index.dart';

class ConfigBloc extends Bloc<ConfigEvent, ConfigState> {
  static final ConfigBloc configBlocSingleTon = ConfigBloc.internal();

  factory ConfigBloc() {
    return configBlocSingleTon;
  }

  ConfigBloc.internal();

// ************************************Bloc Variable *********************
  bool isDarkModeOn = false;
  bool isLoading = false;
// ************************************Bloc Variable *********************

  @override
  ConfigState get initialState => UnConfigState();

  @override
  Stream<ConfigState> mapEventToState(
    ConfigEvent event,
  ) async* {
    try {
      yield UnConfigState();
      yield await event.applyAsync(currentState: currentState, bloc: this);
    } catch (_, statcktrace) {
      print("$_ $statcktrace");
    }
  }
}
