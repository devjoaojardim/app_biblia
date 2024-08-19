import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colorsMVC.dart';


class AppTheme {
  static ThemeData theme = ThemeData(
    primaryColor: AppColors.mainAppColor,
    primaryColorDark: AppColors.blackColor,
    appBarTheme: AppBarTheme(
      titleTextStyle: const TextStyle(fontSize: 18),
      systemOverlayStyle: SystemUiOverlayStyle(statusBarBrightness: Brightness.light, statusBarIconBrightness: Brightness.dark,),
      color: AppColors.mainAppColor,
      foregroundColor: Colors.white,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
      backgroundColor: AppColors.mainAppColor,
    ),
    useMaterial3: true,
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.montserrat(
        fontSize: 15,
        fontWeight: FontWeight.w500
      ),
      bodyMedium: GoogleFonts.montserrat(
        fontSize: 14,
      ),
      bodySmall: GoogleFonts.montserrat(
        fontSize: 13,
      ),
      titleLarge: GoogleFonts.montserrat(
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: GoogleFonts.montserrat(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: GoogleFonts.montserrat(
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: GoogleFonts.montserrat(
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),

    ),
  );
}
