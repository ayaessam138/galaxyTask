import 'package:dartz/dartz.dart';
import 'package:galaxy/core/failure.dart';
import 'package:galaxy/domain/entity/home_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<HomeEntity>>> getHomeArticles({required int period});
}
