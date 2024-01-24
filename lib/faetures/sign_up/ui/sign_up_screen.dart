import 'package:doc_booker/core/helpers/spacing.dart';
import 'package:doc_booker/core/theming/text_style.dart';
import 'package:doc_booker/core/widgets/app_text_buttom.dart';
import 'package:doc_booker/faetures/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:doc_booker/faetures/sign_up/sign_up_widgets/already_have_an_account.dart';
import 'package:doc_booker/faetures/sign_up/sign_up_widgets/create_account_and_sign_up_text.dart';
import 'package:doc_booker/faetures/sign_up/sign_up_widgets/sign_up_bloc_listener.dart';
import 'package:doc_booker/faetures/sign_up/sign_up_widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.w),
          child: Column(
            children: [
              const CreateAccountAndSignUpText(),
              verticalSpace(15),
              const EmailAndPaswwordAndNumberTextFeild(),
              verticalSpace(20),
              AppTextButton(
                buttonText: "Create Account",
                textStyle: TextStyles.font16WhiteSemiBold,
                onPressed: () {
                  validateThenDoSignup(context);
                },
              ),
              verticalSpace(30),
              const AlreadyHaveAccountText(),
              const SignupBlocListener(),
            ],
          ),
        ),
      ),
    ));
  }

  void validateThenDoSignup(BuildContext context) {
    if (context.read<SignUpCubit>().formKey.currentState!.validate()) {
      context.read<SignUpCubit>().emitSignUpStates();
    }
  }
}
