// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:doc_booker/core/networking/api_error_handler.dart';
import 'package:doc_booker/core/networking/api_result.dart';
import 'package:doc_booker/core/networking/api_service.dart';
import 'package:doc_booker/faetures/sign_up/data/models/sign_up_request_body.dart';
import 'package:doc_booker/faetures/sign_up/data/models/sign_up_response.dart';

class SignUpRepository {
  final ApiService _apiService;
  SignUpRepository(this._apiService);

  Future<ApiResult<SignupResponse>> signUp(
      SignupRequestBody signupRequestBody) async {
    try {
      final signUpResponse = await _apiService.signUp(signupRequestBody);
     return ApiResult.success(signUpResponse);
    } catch (error) {
     return  ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
