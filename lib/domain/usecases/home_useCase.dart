import 'package:dartz/dartz.dart';
import 'package:galaxy/core/failure.dart';
import 'package:galaxy/core/usecases/usecase.dart';
import 'package:galaxy/domain/entity/home_entity.dart';
import 'package:galaxy/domain/repo/home_repo.dart';

class HomeUseCase extends UseCase<List<HomeEntity>, int> {
  final HomeRepo homeRepo;
  HomeUseCase({required this.homeRepo});
  @override
  Future<Either<Failure, List<HomeEntity>>> call( [int ?period]) {
    return homeRepo.getHomeArticles(period: period??7);
  }
}
