import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxy/core/theming/text_style.dart';
import 'package:galaxy/persentaion/home/controller/home_cubit.dart';
import 'package:galaxy/persentaion/home/screens/articlesdeatils_screen.dart';
import 'package:galaxy/persentaion/home/widgets/home_listview_card_widget.dart';

class HomeListviewWidget extends StatelessWidget {
  const HomeListviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is Success ||
          current is Loading ||
          current is Fail ||
          current is SearchModeToggled,
      builder: (context, state) {
        var cubit = BlocProvider.of<HomeCubit>(context);
        if (state is Success || state is SearchModeToggled) {
          return Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                await cubit.clearList(
                  period: cubit.selectedValue,
                );
              },
              child: ListView.separated(
                padding: EdgeInsets.all(16.sp),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var article=BlocProvider.of<HomeCubit>(context).isSearching
                      ? BlocProvider.of<HomeCubit>(context)
                      .filteredList[index]
                      : BlocProvider.of<HomeCubit>(context)
                      .homeArticlesList[index];
                  return HomeListviewCardWidget(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return ArticlesDetailsScreen(
                            homeEntity:
                            article,
                          );
                        },
                      ));
                    },
                    homeEntity: article,
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: AppHeight.h8);
                },
                itemCount: BlocProvider.of<HomeCubit>(context).isSearching
                    ? BlocProvider.of<HomeCubit>(context).filteredList.length
                    : BlocProvider.of<HomeCubit>(context)
                        .homeArticlesList
                        .length,
              ),
            ),
          );
        }
        if (state is Fail) {
          return Text(
            state.message,
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
