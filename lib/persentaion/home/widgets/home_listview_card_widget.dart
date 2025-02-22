import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxy/core/theming/colors.dart';
import 'package:galaxy/core/theming/text_style.dart';
import 'package:galaxy/domain/entity/home_entity.dart';

class HomeListviewCardWidget extends StatelessWidget {
  const HomeListviewCardWidget(
      {super.key, required this.onTap, required this.homeEntity});
  final HomeEntity homeEntity;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          spacing: AppWidth.w16,
          children: [
            CircleAvatar(
              radius: 30.r,
              child: Image.network(homeEntity.image??'',
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.error);
              },),
            ),
            Expanded(
              child: Column(
                spacing: AppHeight.h6,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    homeEntity.mainTitle??'',
                    style: TextStyles.font16Medium,
                  ),
                  Text(
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    homeEntity.description??'',
                    style: TextStyles.font14Regular
                        .copyWith(color: ColorsManager.greyColor),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: onTap,
              child: Icon(
                Icons.arrow_forward_ios,
                color: ColorsManager.greyDarkColor,
                size: 25.sp,
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Row(
              children: [
                Icon(
                  Icons.calendar_month,
                  color: ColorsManager.greyDarkColor,
                ),
                Text(
                homeEntity.publishDate??'',
                  style: TextStyles.font14Regular,
                ),
              ],
            ),
            SizedBox(
              width: AppWidth.w70,
            )
          ],
        )
      ],
    );
  }
}
