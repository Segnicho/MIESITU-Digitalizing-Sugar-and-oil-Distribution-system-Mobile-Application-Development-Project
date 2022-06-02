import 'dart:async';
import 'dart:convert';
// import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:labpract/application/auth/events/auth_events.dart';
import 'package:labpract/application/auth/states/auth_state.dart';
import 'package:labpract/domain/auth/entity/auth_model.dart';
import 'package:labpract/domain/auth/validation/invalid_validation.dart';
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
        // jsonEncode(object)
        // jsonEncode(event.register);
        // print(jsonEncode(event.register));
        // print("nccccccccccckdssssssssss");
        // print(event.register.email);
        // print(event.register.username);

        // print(event.register);

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

    on<LoginEvent>((event, emit) async {
      {
        emit(LoggingIn());
        try {
          print('Logfgfgfdgfdging');
          print(event.login);
          print(event.login.email);
          print(event.login.password);
          Map res = await authRepository.signIn(
              event.login.email, event.login.password);
          if (res["type"] == "admin") {
            print("aaaaaaaaadddddddmmmiiiiiiiiiin");
            emit(AdminLoginSuccess());
          }
          emit(LoginSuccess());
        } catch (e) {
          print(e);
          print("oooooooooooooooooooo");
          emit(LogginError("Logiin failed:${e.toString()} }"));
        }
      }
    });

    // @override
    // Stream<AuthState> mapEventToState(AuthEvent event) async* {
    //   if (event is LoginEvent) {
    //     yield LoggingIn();
    //     try {
    //       User user = await authRepository.signIn(event.login);
    //       currentUser = user;
    //       yield LoginSuccess(user: user);
    //     } on InvalidCredential catch (e) {
    //       final msg = e.failedValue;
    //       print(msg);
    //       yield LogginError('$msg');
    //     }
    //   }

    //  else if (event is NextButtonPressed) {
    //   final phone = event.phone;
    //   if (phone.length == 9) {
    //     print(phone);
    //     try {
    //       /*  otp.sendOtp(phone, null, 1000, 9000, dialCode); */
    //       yield OTPMessageSend();
    //     } catch (e) {
    //       RegisterError("insert correct phone number");
    //     }
    // }
    // }
    // else if (event is VerificationButtonPressed) {
    //   /* final verification = event.verificationCode;
    //   /* final verified = otp.resultChecker(int.parse(verification)); */
    //   if (verified)
    //     yield VerificationSuccessful();
    //   else
    //     yield RegisterError("Wrong verification code"); */
    // }

    // else if (event is RegisterEvent) {
    //   yield Registering();
    //   try {
    //     print('registering');
    //     bool res = await authRepository.signUp(event.register);
    //     if (res) {
    //       print("created successfuly");
    //       yield RegisterSuccess();
    //     }
    //   } catch (e) {
    //     yield RegisterError("Register failed: ${e.response.data['message']}");
    //   }
    // }
  }
}
