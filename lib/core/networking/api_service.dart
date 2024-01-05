import 'package:dio/dio.dart';
import 'package:doc_booker/core/networking/api_constants.dart';
import 'package:doc_booker/faetures/login/data/models/login_response.dart';
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
}
