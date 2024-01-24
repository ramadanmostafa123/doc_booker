import 'package:dio/dio.dart';
import 'package:doc_booker/core/networking/api_service.dart';
import 'package:doc_booker/core/networking/dio_factory.dart';
import 'package:doc_booker/faetures/login/data/logic/cubit/login_cubit.dart';
import 'package:doc_booker/faetures/login/data/repo/login_repo.dart';
import 'package:doc_booker/faetures/sign_up/data/repo/sign_up_repo.dart';
import 'package:doc_booker/faetures/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setUpGetIt() async {

  //dio and ApiServices
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  

  //Login
  getIt.registerLazySingleton<LoginRepository>(() => LoginRepository(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  //Sigb up
  getIt.registerLazySingleton<SignUpRepository>(() => SignUpRepository(getIt()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));
}
