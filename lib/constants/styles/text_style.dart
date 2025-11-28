import 'package:flutter/material.dart';
import 'package:glam_connect/constants/styles/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static const FontWeight regularText = FontWeight.normal;
  static const FontWeight mediumText = FontWeight.w500;
  static const FontWeight semiBoldText = FontWeight.w600;
  static const FontWeight boldText = FontWeight.w700;
  static const FontWeight extraBoldText = FontWeight.w800;

  static TextStyle h3({Color? color, FontWeight? weight}) {
    return GoogleFonts.leagueSpartan(
      color: color ?? AppColors.textColor,
      fontWeight: weight ?? regularText,
      fontSize: 48,
    );
  }

  static TextStyle h4({Color? color, FontWeight? weight}) {
    return GoogleFonts.leagueSpartan(
      color: color ?? AppColors.textColor,
      fontWeight: weight ?? regularText,
      fontSize: 32,
    );
  }

  static TextStyle h5({Color? color, FontWeight? weight}) {
    return GoogleFonts.leagueSpartan(
      color: color ?? AppColors.textColor,
      fontWeight: weight ?? regularText,
      fontSize: 30,
    );
  }

  static TextStyle h6({Color? color, FontWeight? weight}) {
    return GoogleFonts.leagueSpartan(
      color: color ?? AppColors.textColor,
      fontWeight: weight ?? regularText,
      fontSize: 24,
    );
  }

  static TextStyle subHeadline({Color? color, FontWeight? weight}) {
    return GoogleFonts.leagueSpartan(
      color: color ?? AppColors.textColor,
      fontWeight: weight ?? regularText,
      fontSize: 20,
    );
  }

  static TextStyle body1({Color? color, FontWeight? weight}) {
    return GoogleFonts.leagueSpartan(
      color: color ?? AppColors.textColor,
      fontWeight: weight ?? regularText,
      fontSize: 18,
    );
  }

  static TextStyle body2({Color? color, FontWeight? weight}) {
    return GoogleFonts.nunitoSans(
      color: color ?? AppColors.textColor,
      fontWeight: weight ?? regularText,
      fontSize: 16,
      height: 1.2,
    );
  }

  static TextStyle caption1({Color? color, FontWeight? weight}) {
    return GoogleFonts.nunitoSans(
      color: color ?? AppColors.textColor,
      fontWeight: weight ?? regularText,
      fontSize: 14,
      height: 1.2,
    );
  }

  static TextStyle caption2({Color? color, FontWeight? weight}) {
    return GoogleFonts.nunitoSans(
      color: color ?? AppColors.textColor,
      fontWeight: weight ?? regularText,
      fontSize: 12,
    );
  }

  static TextStyle special1({Color? color, FontWeight? weight}) {
    return GoogleFonts.nunitoSans(
      color: color ?? AppColors.textColor,
      fontWeight: weight ?? regularText,
      fontSize: 14,
      decoration: TextDecoration.underline,
      decorationStyle: TextDecorationStyle.solid,
      decorationColor: color ?? AppColors.textColor,
      decorationThickness: 1,
    );
  }

  static TextStyle special2({Color? color, FontWeight? weight}) {
    return GoogleFonts.nunitoSans(
      color: color ?? AppColors.textColor,
      fontWeight: weight ?? regularText,
      fontSize: 12,
    );
  }
}
