import 'package:get_it/get_it.dart';

import '../../features/auth/data/datasource/auth_remote_datasource.dart';
import '../../features/auth/data/repo/auth_repo_impl.dart';
import '../../features/auth/domain/repo/auth_repo.dart';
import '../../features/auth/presentation/bloc/user_bloc.dart';
import '../api/api_client.dart';

final GetIt getIt = GetIt.instance;

void setup() {

  regisetrApiClient();
  registerDatasources();
  registerRepos();
  registerBlocs();
 
}

void regisetrApiClient(){
  getIt.registerSingleton(ApiClient());
}

void registerDatasources(){
  var dio = getIt.get<ApiClient>().getDio();

  getIt.registerSingleton(AuthRemoteDatasource(dio: dio));
}

void registerRepos(){
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      authRemoteDatasource: getIt()
    )
  );
}

void registerBlocs(){
 getIt.registerFactory<UserBloc>(
    () => UserBloc(getIt())
  ); 
}