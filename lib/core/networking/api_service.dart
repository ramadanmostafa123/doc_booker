import 'package:dio/dio.dart';
import 'package:doc_booker/core/networking/api_constants.dart';
import 'package:doc_booker/faetures/login/data/models/login_response.dart';
import 'package:doc_booker/faetures/sign_up/data/models/sign_up_request_body.dart';
import 'package:doc_booker/faetures/sign_up/data/models/sign_up_response.dart';
import 'package:retrofit/retrofit.dart';

import '../../faetures/login/data/models/login_request_body.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );
    @POST(ApiConstants.signup)
  Future<SignupResponse> signUp(
    @Body() SignupRequestBody signupRequestBody,
  );
}
