import 'package:bloc/bloc.dart';
import 'index.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  @override
  HomePageState get initialState => UnHomeState();

  @override
  Stream<HomePageState> mapEventToState(
    HomePageEvent event,
  ) async* {
    try {
      yield UnHomeState();
    } catch (_, stacktrace) {
      yield currentState;
      print("$_ $stacktrace");
    }
  }
}
