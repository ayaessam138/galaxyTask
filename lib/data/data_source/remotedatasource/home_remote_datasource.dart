import 'package:galaxy/core/utils/api.dart';
import 'package:galaxy/core/utils/consts.dart';
import 'package:galaxy/data/models/home_model.dart';
import 'package:galaxy/domain/entity/home_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class HomeRemoteDatasource {
  Future<List<HomeEntity>> getHomeArticle({required int period});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDatasource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});
  @override
  Future<List<HomeEntity>> getHomeArticle({required int period}) async {
    var data = await apiService.get(endPoint: "viewed/$period.json?api-key=nDh2fIETNKIs7ndGA7KP4rDRMVUKpUCh");
    List<HomeEntity> homeArticlesList = [];
    fetchDataRemotely(data, homeArticlesList);
    saveDataInLocalSource(homeArticlesList);
    return homeArticlesList;
  }

  void saveDataInLocalSource(List<HomeEntity> homeArticlesList) {
    var homeArticleBox = Hive.box<HomeEntity>(AppConstants.homeBox);
    homeArticleBox.addAll(homeArticlesList);
  }

  void fetchDataRemotely(
      Map<String, dynamic> data, List<HomeEntity> homeArticlesList) {
    for (var item in data['results']) {
      homeArticlesList.add(Results.fromJson(item));
    }
  }
}
