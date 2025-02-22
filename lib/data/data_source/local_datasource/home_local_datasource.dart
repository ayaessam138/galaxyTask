
import 'package:galaxy/core/utils/consts.dart';
import 'package:galaxy/domain/entity/home_entity.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDatasource {
  List<HomeEntity> getHomeArticle({required int period});
  Future<void> clearHomeArticles();
}

class HomeLocalDataSourceImpl extends HomeLocalDatasource {
  @override
  List<HomeEntity> getHomeArticle({required int period}) {
    var box = Hive.box<HomeEntity>(AppConstants.homeBox);
    return box.values.toList();
  }

  @override
  Future<void> clearHomeArticles() async {
    var box = Hive.box<HomeEntity>(AppConstants.homeBox);
    await box.clear();
  }
}
