import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galaxy/core/utils/dependency_injection.dart';
import 'package:galaxy/core/widgets/appbar_widget.dart';
import 'package:galaxy/data/data_source/local_datasource/home_local_datasource.dart';
import 'package:galaxy/data/repos/home_repo.dart';
import 'package:galaxy/domain/usecases/home_useCase.dart';
import 'package:galaxy/persentaion/home/controller/home_cubit.dart';
import 'package:galaxy/persentaion/home/widgets/home_listview_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => HomeCubit(
              useCase: HomeUseCase(homeRepo: getIt.get<HomeRepoImpl>()),
              homeLocalDataSource: getIt.get<HomeLocalDataSourceImpl>())
            ..fetch(period: 7),
          child: Column(
            children: [AppbarWidget(), HomeListviewWidget()],
          ),
        ),
      ),
    );
  }
}

