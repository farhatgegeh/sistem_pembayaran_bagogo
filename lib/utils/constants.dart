import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/theme/themes.dart';

final TextStyle kHeading1 = GoogleFonts.poppins(
  fontSize: 45,
  fontWeight: FontWeight.bold,
);
final TextStyle kHeading2 = GoogleFonts.poppins(
  fontSize: 40,
  fontWeight: FontWeight.bold,
);
final TextStyle kHeading3 = GoogleFonts.poppins(
  fontSize: 28,
  fontWeight: FontWeight.bold,
);
final TextStyle kHeading4 = GoogleFonts.poppins(
  fontSize: 26,
  fontWeight: FontWeight.w600,
);
final TextStyle kHeading5 = GoogleFonts.poppins(
  fontSize: 23,
  fontWeight: FontWeight.w400,
);
final TextStyle kHeading6 = GoogleFonts.poppins(
  fontSize: 19,
  fontWeight: FontWeight.w500,
  letterSpacing: 0.15,
);
final TextStyle kSubtitle = GoogleFonts.poppins(
  fontSize: 15,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.15,
);
final TextStyle kBodyText = GoogleFonts.poppins(
  fontSize: 13,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.25,
);

final kTextTheme = TextTheme(
  displayLarge: kHeading1,
  displayMedium: kHeading2,
  displaySmall: kHeading3,
  headlineMedium: kHeading4,
  headlineSmall: kHeading5,
  titleLarge: kHeading6,
  titleMedium: kSubtitle,
  bodyMedium: kBodyText,
);

const kColorScheme = ColorScheme(
  primary: kPrimary,
  primaryContainer: kWhite,
  secondary: kWhite,
  secondaryContainer: kWhite,
  surface: kWhite,
  background: kBackGroundColor,
  error: Colors.red,
  onPrimary: kWhite,
  onSecondary: kBlack,
  onSurface: kBlack,
  onBackground: kWhite,
  onError: kBlack,
  brightness: Brightness.light,
);
