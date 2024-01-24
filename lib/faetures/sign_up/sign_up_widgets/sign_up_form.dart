import 'package:doc_booker/core/helpers/app_regex.dart';
import 'package:doc_booker/core/helpers/spacing.dart';
import 'package:doc_booker/core/widgets/app_text_form_feild.dart';
import 'package:doc_booker/faetures/login/login_widgets/password_validation.dart';
import 'package:doc_booker/faetures/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailAndPaswwordAndNumberTextFeild extends StatefulWidget {
  const EmailAndPaswwordAndNumberTextFeild({super.key});

  @override
  State<EmailAndPaswwordAndNumberTextFeild> createState() =>
      _EmailAndPaswwordAndNumberTextFeildState();
}

class _EmailAndPaswwordAndNumberTextFeildState
    extends State<EmailAndPaswwordAndNumberTextFeild> {
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;
  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignUpCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Name must not be empty';
              }
            },
            controller: context.read<SignUpCubit>().nameController,
          ),
          verticalSpace(15),
          AppTextFormField(
            hintText: 'phone number',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPhoneNumberValid(value)) {
                return 'Please enter a valid phone number';
              }
            },
            controller: context.read<SignUpCubit>().phoneController,
          ),
          verticalSpace(15),
          AppTextFormField(
            hintText: 'email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
            },
            controller: context.read<SignUpCubit>().emailController,
          ),
          verticalSpace(15),
          AppTextFormField(
            hintText: 'password',
            suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  isPasswordObscureText = !isPasswordObscureText;
                });
              },
              child: isPasswordObscureText
                  ? const Icon(Icons.visibility_off)
                  : const Icon(Icons.visibility),
            ),
            isObscureText: isPasswordObscureText,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
            },
            controller: context.read<SignUpCubit>().passwordController,
          ),
          verticalSpace(15),
          AppTextFormField(
            controller:
                context.read<SignUpCubit>().passwordConfirmationController,
            hintText: 'Password Confirmation',
            isObscureText: isPasswordConfirmationObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordConfirmationObscureText =
                      !isPasswordConfirmationObscureText;
                });
              },
              child: Icon(
                isPasswordConfirmationObscureText
                    ? Icons.visibility_off
                    : Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
            },
          ),
          verticalSpace(15),
          PasswordValidations(
              hasLowerCase: hasLowercase,
              hasUpperCase: hasUppercase,
              hasSpecialCharacters: hasSpecialCharacters,
              hasNumber: hasNumber,
              hasMinLength: hasMinLength)
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}