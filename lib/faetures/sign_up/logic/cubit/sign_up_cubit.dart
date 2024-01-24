import 'package:doc_booker/core/networking/api_error_handler.dart';
import 'package:doc_booker/faetures/sign_up/data/models/sign_up_request_body.dart';
import 'package:doc_booker/faetures/sign_up/data/repo/sign_up_repo.dart';
import 'package:doc_booker/faetures/sign_up/logic/cubit/sign_up_state.dart';
import 'package:flutter/Widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepository signUpRepository;
  SignUpCubit(this.signUpRepository) : super(const SignUpState.initial());
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitSignUpStates() async {
    emit(const SignUpState.signuploading());
    final response = await signUpRepository.signUp(
      SignupRequestBody(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
        passwordConfirmation: passwordConfirmationController.text,
        gender: 0,
      ),
    );
    response.when(success: (signupResponse) {
      emit(SignUpState.signupsuccess(signupResponse));
    }, failure: ( error) {
      emit(SignUpState.signuperror(error: error.apiErrorModel.message ?? ''));
    });
  }
}
