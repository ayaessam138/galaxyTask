import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:galaxy/core/failure.dart';
import 'package:galaxy/data/data_source/local_datasource/home_local_datasource.dart';
import 'package:galaxy/data/data_source/remotedatasource/home_remote_datasource.dart';
import 'package:galaxy/domain/entity/home_entity.dart';
import 'package:galaxy/domain/repo/home_repo.dart';

class HomeRepoImpl extends HomeRepo{
  final HomeRemoteDatasource homeRemoteDataSource;
  final HomeLocalDatasource homeLocalDataSource;

  HomeRepoImpl({required this.homeRemoteDataSource, required this.homeLocalDataSource});

  @override
  Future<Either<Failure, List<HomeEntity>>> getHomeArticles({required int period})async {
    try {
      var homeArticlesList = homeLocalDataSource.getHomeArticle(
        period: period,
      );
      if (homeArticlesList.isNotEmpty) {
        print("object");
        return right(homeArticlesList);
      }
      homeArticlesList =
          await homeRemoteDataSource.getHomeArticle(period: period);
      return right(homeArticlesList);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}