import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle font12Regular = TextStyle(
    fontSize: AppFontSize.f12,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font14Light = TextStyle(
    fontSize: AppFontSize.f14,
    fontWeight: FontWeightHelper.light,
  );
  static TextStyle font24Regular = TextStyle(
    fontSize: AppFontSize.f24,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font20Regular = TextStyle(
    fontSize: AppFontSize.f20,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font16Regular = TextStyle(
    fontSize: AppFontSize.f16,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font14Regular = TextStyle(
    fontSize: AppFontSize.f14,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font20Medium = TextStyle(
    fontSize: AppFontSize.f20,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font16Medium = TextStyle(
    fontSize: AppFontSize.f16,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font20Bold = TextStyle(
    fontSize: AppFontSize.f20,
    fontWeight: FontWeightHelper.bold,
  );
}

class FontWeightHelper {
  static const FontWeight thin = FontWeight.w100;
  static const FontWeight extraLight = FontWeight.w200;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
}

class AppFontSize {
  static final f40 = 40.sp;
  static final f35 = 35.sp;
  static final f30 = 30.sp;
  static final f28 = 28.sp;
  static final f26 = 26.sp;
  static final f24 = 24.sp;
  static final f22 = 22.sp;
  static final f20 = 20.sp;
  static final f18 = 18.sp;
  static final f16 = 16.sp;
  static final f14 = 14.sp;
  static final f12 = 12.sp;
  static final f10 = 10.sp;
  static final f2 = 2.sp;
  static final f8 = 8.sp;
  static final f32 = 32.sp;
}

class AppHeight {
  static double fullHight(BuildContext context) =>
      MediaQuery.sizeOf(context).height;

  static double h150 = 150.h;
  static double h135 = 135.h;
  static double h120 = 120.h;
  static double h100 = 100.h;
  static double h105 = 105.h;
  static double h90 = 90.h;
  static double h70 = 70.h;

  static double h40 = 40.h;
  static double h20 = 20.h;

  static double h60 = 60.h;
  static double h26 = 26.h;

  static double h24 = 24.h;
  static double h18 = 18.h;
  static double h12 = 12.h;
  static double h10 = 10.h;

  static double h16 = 16.h;
  static double h8 = 8.h;
  static double h6 = 6.h;
  static double h5 = 5.h;
}

class AppWidth {
  static double fullWidth(BuildContext context) =>
      MediaQuery.sizeOf(context).width;

  static double w70 = 70.w;
  static double w16 = 16.w;
  static double w20 = 20.w;
  static double w24 = 24.w;
  static double w12 = 20.w;
  static double w10 = 10.w;
  static double w8 = 8.w;
  static double w5 = 5.w;
  static double w6 = 6.w;
  static double w3 = 3.w;
  static double w1 = 1.w;
}
