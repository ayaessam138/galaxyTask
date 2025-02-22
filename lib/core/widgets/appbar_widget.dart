import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:galaxy/core/theming/colors.dart';
import 'package:galaxy/core/theming/text_style.dart';
import 'package:galaxy/persentaion/home/controller/home_cubit.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(8),
          height: MediaQuery.of(context).size.height * .07,
          decoration: BoxDecoration(
            color: ColorsManager.mainColor
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.menu,
                color:  ColorsManager.white
              ),

              homeCubit.isSearching
                  ? Expanded(
                      child: TextField(
                        controller: homeCubit.query,
                        onChanged: homeCubit.search(),
                        autofocus: true,
                        decoration: const InputDecoration(
                          hintText: "Search...",
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: ColorsManager.greyColor),
                        ),
                        style: const TextStyle(color: ColorsManager.white),
                      ),
                    )
                  :  FittedBox(
                      child: Text(
                        "Ny Times Most Popular",
                        style: TextStyles.font16Medium.copyWith(color: ColorsManager.white)
                      ),
                    ),

              GestureDetector(
                onTap: () {
                  homeCubit.toggleSearchMode();
                  homeCubit.query.clear();
                },
                child: Icon(
                  homeCubit.isSearching ? Icons.close : Icons.search,
                  color: Colors.white,
                ),
              ),

              GestureDetector(
                onTap: () {
                  showMenu(
                    context: context,
                    position: const RelativeRect.fromLTRB(100, 100, 0, 0),
                    items: const [
                      PopupMenuItem(value: 1, child: Text("1")),
                      PopupMenuItem(value: 7, child: Text("7")),
                      PopupMenuItem(value: 30, child: Text("30")),
                    ],
                  ).then((value) {
                    if (value != null) {
                      homeCubit.selectedValue = value;
                      homeCubit.clearList(period: value);
                    }
                  });
                },
                child: const Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
