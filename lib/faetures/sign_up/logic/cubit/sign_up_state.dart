import 'package:freezed_annotation/freezed_annotation.dart';

part'sign_up_state.freezed.dart';

@freezed
class SignUpState<T> with _$SignUpState {
  const factory SignUpState.initial() = _Initial;
  const factory SignUpState.signuploading() = SignupLoading;
  const factory SignUpState.signupsuccess(T data) = SignupSuccess<T>;
  const factory SignUpState.signuperror( {required String error}) =SignupError;

}
