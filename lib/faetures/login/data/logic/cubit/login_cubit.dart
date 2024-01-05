import 'package:bloc/bloc.dart';
import 'package:doc_booker/core/networking/api_error_handler.dart';
import 'package:doc_booker/core/networking/api_result.dart';
import 'package:doc_booker/faetures/login/data/logic/cubit/login_state.dart';
import 'package:doc_booker/faetures/login/data/repo/repo.dart';
import 'package:flutter/Widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/login_request_body.dart';
import '../../models/login_response.dart';

class LoginCubit extends Cubit<LoginState<LoginResponse>> {
  final LoginRepository loginRepository;
  // LoginRequestBody loginRequestBody;
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginCubit(this.loginRepository) : super(const LoginState.initial());

  void emitLoginStates(LoginRequestBody loginRequestBody) async {
    emit(const LoginState.loading());
    final response = await loginRepository.login(loginRequestBody);
    response.when(success: (loginResponse) {
      emit(LoginState.success(loginResponse));
    }, failure: (ErrorHandler error) {
      emit(LoginState.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}
