import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'authentication.dart';

@LazySingleton()
class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationUninitialized());

  void refreshSplash() {
    emit(AuthenticationLoading());
    print("refreshSplash");
    emit(AuthenticationUninitialized());
  }

  void openApp() async {
    emit(AuthenticationLoading());
    emit(AuthenticationUnauthenticated());
  }
}
