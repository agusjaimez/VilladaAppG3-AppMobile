import 'package:bloc/bloc.dart';
import 'package:comunicacion/screens/home/principal.dart';
import 'package:comunicacion/screens/home/sidebar/formularios/formularioF1.dart';
import 'package:comunicacion/screens/home/sidebar/formularios/formularioF2.dart';
import 'package:comunicacion/screens/home/sidebar/formularios/formularioF3.dart';

enum NavigationEvents {
  PrincipalPageEvent,
  FormularioF1Event,
  FormularioF2Event,
  FormularioF3Event,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  NavigationBloc(NavigationStates initialState) : super(Principal());

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.PrincipalPageEvent:
        yield Principal();
        break;
      case NavigationEvents.FormularioF1Event:
        yield F1();
        break;
      case NavigationEvents.FormularioF2Event:
        yield F2();
        break;
      case NavigationEvents.FormularioF3Event:
        yield F3();
        break;
    }
  }
}
