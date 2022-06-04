// import 'dart:async';

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:labpract/application/auth/events/auth_events.dart';

// import 'package:labpract/application/auth/events/status_events.dart';
// import 'package:labpract/application/auth/states/auth_state.dart';
// import 'package:labpract/application/auth/states/status_state.dart';
// import 'package:labpract/domain/auth/entity/auth_model.dart';
// import 'package:labpract/infra/auth/repository/auth_repository.dart';
// import 'package:labpract/infra/auth/repository/user_crud.dart';

// class CurrentStatusBloc extends Bloc<CurrentStatusEvent, CurrentStatusState> {
//   final AuthRepository authRepository;
//   final UserDB userdb;

//   CurrentStatusBloc(this.authRepository, this.userdb) : super(AppInitState());

//  @override
//   on<LogoutEvent>((event, emit)async {
//       {
//         // emit(Registering());
//         bool res = await authRepository.signUp(event.register);
//         print(res);
//         if (res) {
//           emit(RegisterSuccess());
//         } else if (res == false) {
//           emit(RegisterError("error bea"));
//         }
//       }});
// }
