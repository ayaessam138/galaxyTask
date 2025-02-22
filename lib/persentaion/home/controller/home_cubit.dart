import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:galaxy/core/failure.dart';
import 'package:galaxy/data/data_source/local_datasource/home_local_datasource.dart';
import 'package:galaxy/domain/entity/home_entity.dart';
import 'package:galaxy/domain/usecases/home_useCase.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.useCase, required this.homeLocalDataSource})
      : super(HomeInitial());

  final HomeUseCase useCase;
  final HomeLocalDatasource homeLocalDataSource;

  List<HomeEntity> homeArticlesList = [];

  Future<void> fetch({
    required int period,
  }) async {
    emit(Loading());
    var result = await useCase.call(period);
    result.fold((failure) {
      emit(Fail(message: failure.message));
    }, (articlesList) {
      homeArticlesList = articlesList;
      emit(Success());
    });
  }

  int selectedValue = 1;
  clearList({required int period}) async {
    await homeLocalDataSource.clearHomeArticles();
    await fetch(period: period);
  }

  List<HomeEntity> filteredList = [];
  TextEditingController query = TextEditingController();
  search() {
    if (query.text.isEmpty) {
      filteredList = List.from(homeArticlesList);
    } else {
      filteredList = homeArticlesList
          .where(
              (article) => article.mainTitle.toLowerCase().contains(query.text))
          .toList();
    }
    emit(Success());
  }

  bool isSearching = false;
  void toggleSearchMode() {
    isSearching = !isSearching;

    emit(SearchModeToggled(isSearching));
  }
}
