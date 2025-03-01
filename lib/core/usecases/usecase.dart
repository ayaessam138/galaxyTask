import 'package:dartz/dartz.dart';
import 'package:galaxy/core/failure.dart';

abstract class UseCase<Type, Param> {
  Future<Either<Failure, Type>> call([Param param]);
}

class NoParam {}