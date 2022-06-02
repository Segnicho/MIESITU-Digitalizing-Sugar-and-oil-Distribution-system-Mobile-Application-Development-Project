import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:labpract/application/auth/events/status_events.dart';
import 'package:labpract/application/auth/states/status_state.dart';
import 'package:labpract/domain/auth/entity/auth_model.dart';
import 'package:labpract/infra/auth/repository/auth_repository.dart';

class CurrentStatusBloc extends Bloc<CurrentStatusEvent, CurrentStatusState> {
  final AuthRepository authRepository;
  CurrentStatusBloc(this.authRepository) : super(AppInitState());

  Stream<CurrentStatusState> mapEventToState(CurrentStatusEvent event) async* {
    if (event is CheckAuthenticationEvent) {
      try {
        final user = await authRepository.checkUser();
        if (user.isEmpty) {
          yield UnAuthenticatedState();
        } else {
          currentUser = User.fromJson(user);
          // print("curent user ${currentUser!.roles}");
          yield AuthenticatedState(currentUser!);
        }
      } catch (e) {
        print("error");
      }
    }
  }
}
