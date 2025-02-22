import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxy/core/theming/colors.dart';
import 'package:galaxy/core/theming/text_style.dart';
import 'package:galaxy/core/utils/dependency_injection.dart';
import 'package:galaxy/data/data_source/local_datasource/home_local_datasource.dart';
import 'package:galaxy/data/repos/home_repo.dart';
import 'package:galaxy/domain/entity/home_entity.dart';
import 'package:galaxy/domain/usecases/home_useCase.dart';
import 'package:galaxy/persentaion/home/controller/home_cubit.dart';

class ArticlesDetailsScreen extends StatelessWidget {
  const ArticlesDetailsScreen({super.key, required this.homeEntity});

  final HomeEntity homeEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorsManager.white),
        backgroundColor: ColorsManager.mainColor,
        title: Text(
          "Ny Times Most Popular",
          style: TextStyles.font16Medium.copyWith(color: ColorsManager.white),
        ),
      ),
      body: BlocProvider(
          create: (context) => HomeCubit(
              useCase: HomeUseCase(homeRepo: getIt.get<HomeRepoImpl>()),
              homeLocalDataSource: getIt.get<HomeLocalDataSourceImpl>()),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.sp),
            child: Column(
              spacing: AppHeight.h12,
              children: [
                Text(
                  homeEntity.mainTitle ?? '',
                  style: TextStyles.font20Bold,
                ),
                Text(
                  homeEntity.description ?? '',
                  style: TextStyles.font14Regular
                      .copyWith(color: ColorsManager.greyColor),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        homeEntity.author ?? '',
                        style: TextStyles.font12Regular,
                      ),
                    ),
                    Expanded(
                      child: Text(    maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        homeEntity.publishDate ?? '',
                        style: TextStyles.font12Regular,
                      ),
                    ),
                  ],
                ),
                Container(
                    height: AppHeight.fullHight(context) * .3,
                    width: AppWidth.fullWidth(context),
                    decoration: BoxDecoration(
                        color: ColorsManager.greyColor,
                        borderRadius: BorderRadius.circular(12.r)),
                    child: Image.network(
                      homeEntity.image ?? "",
                       fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(Icons.error);
                      },
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Source:",
                      style: TextStyles.font12Regular,
                    ),
                    Text(
                      homeEntity.source ?? "",
                      style: TextStyles.font12Regular,
                    ),
                  ],
                ),
                Text(
                  homeEntity.article ?? "",
                  style: TextStyles.font14Regular,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
