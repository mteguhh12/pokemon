import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension CustomTheme on TextTheme {
  TextStyle get heading3 {
    return TextStyle(
        color: Colors.black,
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
        height: 32 / 20);
  }

  TextStyle get subHeading1 {
    return TextStyle(
        color: Colors.black,
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        height: 24 / 14);
  }

  TextStyle get subHeading2 {
    return TextStyle(
        color: Colors.black,
        fontSize: 14.sp,
        fontWeight: FontWeight.w300,
        height: 24 / 14);
  }

  TextStyle get bodyRegular => TextStyle(
        color: Colors.black,
        fontSize: 13.sp,
        fontWeight: FontWeight.w400,
        height: 24 / 13,
      );

  TextStyle get bodyBold => TextStyle(
        color: Colors.black,
        fontSize: 13.sp,
        fontWeight: FontWeight.w600,
        height: 24 / 13,
      );

  TextStyle get bodySmallText => TextStyle(
        color: Colors.black,
        fontSize: 11.sp,
        fontWeight: FontWeight.w400,
        height: 20 / 11,
      );

  TextStyle get bodySmallBold => TextStyle(
        color: Colors.black,
        fontSize: 11.sp,
        fontWeight: FontWeight.bold,
        height: 20 / 11,
      );

  TextStyle get bodySmallSemiBold => TextStyle(
        color: Colors.black,
        fontSize: 11.sp,
        fontWeight: FontWeight.w600,
        height: 20 / 11,
      );

  TextStyle get subTitleRegular => TextStyle(
        color: Colors.black,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        height: 24 / 14,
      );

  TextStyle get buttonCapital => TextStyle(
        color: Colors.black,
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        height: 24 / 16,
      );

  TextStyle get buttonRegular => TextStyle(
        color: Colors.black,
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        height: 24 / 16,
      );

  TextStyle get buttonSmall => TextStyle(
        color: Colors.black,
        fontSize: 12.sp,
        fontWeight: FontWeight.bold,
        height: 20 / 12,
      );

  TextStyle get buttonLink => TextStyle(
      color: Colors.black,
      fontSize: 11.sp,
      fontWeight: FontWeight.w500,
      height: 24 / 11);

  TextStyle get labelTag => TextStyle(
      color: Colors.black,
      fontSize: 14.sp,
      fontWeight: FontWeight.bold,
      height: 20 / 14);

  TextStyle get tooltip => TextStyle(
      color: Colors.black,
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      height: 16 / 12);

  TextStyle get labelLargeText => TextStyle(
      color: Colors.black,
      fontSize: 12.sp,
      fontWeight: FontWeight.w600,
      height: 20 / 12);

  TextStyle get labelSmallText => TextStyle(
      color: Colors.black,
      fontSize: 10.sp,
      fontWeight: FontWeight.w400,
      height: 16 / 10);

  TextStyle get labelSmallTextSemiBold => TextStyle(
      color: Colors.black,
      fontSize: 10.sp,
      fontWeight: FontWeight.w500,
      height: 15 / 10);

  TextStyle get labelSmallTextBold => TextStyle(
      color: Colors.black,
      fontSize: 10.sp,
      fontWeight: FontWeight.w600,
      height: 16 / 10);

  TextStyle get labelSmallTextBolder => TextStyle(
      color: Colors.black,
      fontSize: 10.sp,
      fontWeight: FontWeight.bold,
      height: 13 / 10);

  TextStyle get labelMiniText => TextStyle(
      color: Colors.black,
      fontSize: 9.sp,
      fontWeight: FontWeight.w400,
      height: 12 / 9);

  TextStyle get labelMicroText => TextStyle(
      color: Colors.black,
      fontSize: 8.sp,
      fontWeight: FontWeight.w400,
      height: 12 / 8);

  TextStyle get labelMicroSemiBoldText => TextStyle(
      color: Colors.black,
      fontSize: 8.sp,
      fontWeight: FontWeight.w500,
      height: 12 / 8);

  TextStyle get labelMicroBoldText => TextStyle(
      color: Colors.black,
      fontSize: 8.sp,
      fontWeight: FontWeight.w600,
      height: 12 / 8);

  TextStyle get labelNanoBoldText => TextStyle(
      color: Colors.black,
      fontSize: 7.sp,
      fontWeight: FontWeight.w600,
      height: 11 / 7);

  TextStyle get labelNanoText => TextStyle(
      color: Colors.black,
      fontSize: 6.sp,
      fontWeight: FontWeight.w400,
      height: 10 / 6);

  TextStyle get title1 => TextStyle(
      color: Colors.black,
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
      height: 24 / 18);

  TextStyle get title2 => TextStyle(
      color: Colors.black,
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
      height: 24 / 16);

  TextStyle get title3 => TextStyle(
      color: Colors.black,
      fontSize: 24.sp,
      fontWeight: FontWeight.w700,
      height: 32 / 24);

  TextStyle get labelMarco => TextStyle(
      color: Colors.black,
      fontSize: 8.sp,
      fontWeight: FontWeight.w400,
      height: 12 / 8);

  TextStyle get titleSmallBold => TextStyle(
      color: Colors.black,
      fontSize: 11.sp,
      fontWeight: FontWeight.w600,
      height: 20 / 11);
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}
