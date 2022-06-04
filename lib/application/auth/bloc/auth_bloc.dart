import 'dart:async';
import 'dart:convert';

// import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:labpract/application/auth/events/auth_events.dart';
// import 'package:labpract/application/auth/events/status_events.dart';
import 'package:labpract/application/auth/states/auth_state.dart';
import 'package:labpract/application/auth/states/status_state.dart';
// import 'package:labpract/application/auth/states/status_state.dart';
import 'package:labpract/domain/auth/entity/auth_model.dart';
// import 'package:labpract/domain/auth/validation/invalid_validation.dart';
import 'package:labpract/infra/auth/repository/auth_repository.dart';
//import 'package:flutter_otp/flutter_otp.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  // Register register;
  //final FlutterOtp otp;
  AuthBloc(
    this.authRepository,
  ) : super(InitState()) {
    on<RegisterEvent>((event, emit) async {
      {
        emit(Registering());
        bool res = await authRepository.signUp(event.register);
        print(res);
        if (res) {
          emit(RegisterSuccess());
        } else if (res == false) {
          emit(RegisterError("error bea"));
        }

        // try {
        //   print('registeriiiiiiiiiiiiiiiiiing');
        //   print(true == true);
        //   print(event.register);
        //   bool res = await authRepository.signUp(event.register);
        //   //  (res) {
        //   //   print("created successfuly");
        //   emit(RegisterSuccess());
        //   // return;
        //   // }
        // } catch (e) {
        //   print(e);
        //   emit(RegisterError("Error Occured on the registreaion process"));
        //   // RegisterError("Register failed: ${e.response.data['message']}");
        // }

      }
    });
    // on<LogoutEvent>((event, emit) async {
    //   emit(UnAuthenticatedState());
    // });

    on<LoginEvent>((event, emit) async {
      {
        emit(LoggingIn());
        try {
// authRepository

          // print('Logfgfgfdgfdging');
          print(event.login);
          print("email: ${event.login.email}");
          print(event.login.password);
          User user = await authRepository.signIn(
              event.login.email, event.login.password);
          // currentUser = user;
          if (AuthRepository.isadmin) {
            // print("admmmmmmmmmminnnnnnnnnnn");
            emit(AdminLoginSuccess(user: user));
            return;
          }

          return emit(LoginSuccess(user: user));
        } catch (e) {
          emit(LogginError("Logiin failed:${e.toString()}"));
        }
      }
    });

    // on<LogoutEvent>((event, emit) async {});
  }
}
