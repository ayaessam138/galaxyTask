import 'package:dio/dio.dart';
import 'package:galaxy/core/utils/api.dart';
import 'package:galaxy/data/data_source/local_datasource/home_local_datasource.dart';
import 'package:galaxy/data/data_source/remotedatasource/home_remote_datasource.dart';
import 'package:galaxy/data/repos/home_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
      homeRemoteDataSource:
          HomeRemoteDataSourceImpl(apiService: getIt.get<ApiService>()),
      homeLocalDataSource: HomeLocalDataSourceImpl()));

  getIt.registerSingleton<HomeLocalDataSourceImpl>(HomeLocalDataSourceImpl());
}
