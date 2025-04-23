import 'package:dio/dio.dart';
import 'package:ferry/ferry.dart';
import 'package:flutter_core/core/auth/datasources/remote/token_remote_datasource.dart';
import 'package:flutter_core/core/auth/datasources/remote/token_remote_datasource_graphql_impl.dart';
import 'package:flutter_core/core/auth/datasources/remote/token_remote_datasource_rest_impl.dart';
import 'package:flutter_core/core/network/dio/dio_client.dart';
import 'package:flutter_core/core/network/dio/dio_options.dart';
import 'package:flutter_core/core/network/dio/api_clients/token_api_client.dart';
import 'package:flutter_core/core/auth/datasources/local/token_local_datasource.dart';
import 'package:flutter_core/core/auth/datasources/local/token_local_datasource_impl.dart';
import 'package:flutter_core/core/auth/repositories/token_repository.dart';
import 'package:flutter_core/core/auth/repositories/token_repository_rest_impl.dart';
import 'package:flutter_core/core/network/graphql/graphql_client.dart';
import 'package:flutter_core/core/network/graphql/graphql_config.dart';
import 'package:flutter_core/core/network/graphql/graphql_link.dart';
import 'package:flutter_core/src/features/auth/data/api/auth_api_client.dart';
import 'package:flutter_core/src/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_core/src/features/auth/data/datasources/auth_remote_data_source_impl.dart';
import 'package:flutter_core/src/features/auth/data/datasources/user_remote_data_source.dart';
import 'package:flutter_core/src/features/auth/data/datasources/user_remote_data_source_impl.dart';
import 'package:flutter_core/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_core/src/features/auth/data/repositories/user_repository_impl.dart';
import 'package:flutter_core/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_core/src/features/auth/domain/repositories/user_repository.dart';
import 'package:flutter_core/src/features/auth/domain/usecases/get_user_use_case.dart';
import 'package:flutter_core/src/features/auth/domain/usecases/login_use_case.dart';
import 'package:flutter_core/src/features/auth/domain/usecases/logout_use_case.dart';
import 'package:flutter_core/src/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:flutter_core/src/features/auth/presentation/blocs/user_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:gql_http_link/gql_http_link.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static Future<void> init() async {
    await _initExternalServices();
    await _initTokenRepositories();
    //await _initClients();
    await _initGraphQL();
    await _initDatasources();
    await _initRepositories();
    await _initUseCases();
    await _initBlocs();
  }

  static Future<void> _initExternalServices() async {
    const secureStorage = FlutterSecureStorage();
    sl.registerLazySingleton(() => secureStorage);
  }

  static Future<void> _initTokenRepositories() async {
    sl
      ..registerLazySingleton<TokenLocalDataSource>(
        () => TokenLocalDataSourceImpl(sl()),
      )
      ..registerLazySingleton<TokenRepository>(
        () => TokenRepositoryImpl(sl(), sl()),
      );
  }

  static Future<void> _initGraphQL() async {
    final baseUrl = dotenv.env['GRAPHQL_BASE_URL'];
    // 1. 기본 Client 생성
    final client = Client(link: HttpLink(baseUrl ?? ''), cache: Cache());

    // 2. Client 등록
    sl.registerLazySingleton<Client>(() => client);

    // 3. TokenRemoteDataSource 등록
    sl.registerLazySingleton<TokenRemoteDataSource>(
      () => TokenRemoteDataSourceGraphqlImpl(client),
    );
    sl.registerLazySingleton<GqlClient>(
      () => GqlClient(
        config: GqlConfig(
          baseUrl: baseUrl ?? '',
          tokenRepository: sl<TokenRepository>(), // 이제 안전!
        ),
      ),
    );
  }

  static Future<void> _initClients() async {
    // 환경 변수에서 baseUrl 가져오기
    final baseUrl = dotenv.env['API_BASE_URL'];

    // 1. 토큰 리프레시 전용 Dio (인터셉터 없이)
    final authDio = Dio(DioOptions.getBaseOptions(baseUrl ?? ''));
    sl.registerLazySingleton<Dio>(() => authDio);

    // 2. TokenApiClient - refreshToken용으로 authDio 사용
    sl.registerLazySingleton<TokenApiClient>(
      () => TokenApiClient(authDio, baseUrl: baseUrl ?? ''),
    );

    // 3. TokenRemoteDataSource 등록
    sl.registerLazySingleton<TokenRemoteDataSource>(
      () => TokenRemoteDataSourceRestImpl(sl<TokenApiClient>()),
    );

    // 4. 일반 API용 DioClient - interceptor 포함
    final mainDioClient = DioClient(
      baseUrl: baseUrl ?? '',
      tokenRepository: sl<TokenRepository>(),
    );

    sl
      ..registerLazySingleton(() => mainDioClient.dio)
      ..registerLazySingleton(() => mainDioClient.baseUrl)
      ..registerLazySingleton<AuthApiClient>(
        () => AuthApiClient(mainDioClient.dio, baseUrl: mainDioClient.baseUrl),
      );
  }

  static Future<void> _initDatasources() async {
    // sl.registerLazySingleton<AuthRemoteDataSource>(
    //   () => AuthRemoteDataSourceImpl(sl()),
    // );
    sl.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl(sl()),
    );
  }

  static Future<void> _initRepositories() async {
    // sl.registerLazySingleton<AuthRepository>(
    //   () => AuthRepositoryImpl(sl(), sl()),
    // );
    sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(sl()));
  }

  static Future<void> _initUseCases() async {
    // sl
    //   ..registerLazySingleton(() => LoginUseCase(sl()))
    //   ..registerLazySingleton(() => LogoutUseCase(sl()));
    sl.registerLazySingleton(() => GetUserUseCase(userRepository: sl()));
  }

  static Future<void> _initBlocs() async {
    // sl.registerLazySingleton(
    //   () => AuthBloc(loginUseCase: sl(), logoutUseCase: sl()),
    // );
    sl.registerLazySingleton(() => UserBloc(getUserUseCase: sl()));
  }
}
