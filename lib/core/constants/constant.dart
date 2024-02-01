import 'package:kelotimaja/Styles/button.dart';
import 'package:flutter/material.dart';
import 'package:kelotimaja/theme.dart';

String chatApiSecretKey = "9crn15N3HsV";

Color scaffoldBgColor = const Color(0xFFF4F4F4);
Color primaryColor = const Color(0xFF396631);
Color darkPrimaryColor = const Color(0xFF396631);
Color greyColor = Colors.grey;
Color whiteColor = Colors.white;
Color blackColor = Colors.black;
Color bluepuloColor = const Color(0xFF396631);
Color redColor = Colors.red;
Color lightGreyColor = Colors.grey.withOpacity(0.3);

//colors
Color green1 = const Color(0xff097210);
Color green2 = const Color(0xff00880F);

// Color dark1 = const Color(0xff1C1C1C);
Color dark2 = const Color(0xff4A4A4A);
Color dark3 = const Color(0xff999798);
Color dark4 = const Color(0xffEDEDED);

// Color blue1 = const Color(0xff0281A0);
// Color blue2 = const Color(0xff00AED5);
Color blue3 = const Color(0xff38BBDA);

Color red = const Color(0xffED2739);
Color purple = const Color(0xff87027B);

// Definisikan warna yang akan digunakan
Color blue1 = const Color(0xff3B9DD7);
Color blue2 = const Color(0xff9BD8FC);
Color orange = const Color(0xFFFFA500);
Color dark1 = const Color(0xff1C1C1C);

//typography

TextStyle regular12_5 =
    const TextStyle(fontFamily: 'SF-Pro-Display', fontSize: 12.5);
TextStyle regular14 = regular12_5.copyWith(fontSize: 14);

TextStyle semibold12_5 = regular12_5.copyWith(fontWeight: FontWeight.w600);
TextStyle semibold14 = semibold12_5.copyWith(fontSize: 14, letterSpacing: 0.1);

TextStyle bold16 = regular12_5.copyWith(
    fontWeight: FontWeight.w700, fontSize: 16, letterSpacing: 0.1);
TextStyle bold18 = bold16.copyWith(fontSize: 18, letterSpacing: -0.5);

double fixPadding = 10.0;

SizedBox heightSpace = const SizedBox(height: 10.0);
SizedBox widthSpace = const SizedBox(width: 10.0);

TextStyle bottomBarItemStyle = TextStyle(
  color: greyColor,
  fontSize: 12.0,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w500,
);

TextStyle greystyle = TextStyle(
  fontSize: 15.0,
  color: Colors.grey.withOpacity(0.6),
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w500,
);
// TextStyle bigHeadingStyle = TextStyle(
//   fontSize: 22.0,
//   color: blackColor,
//   fontFamily: 'Roboto',
//   fontWeight: FontWeight.w600,
// );

TextStyle onboardingTitleStyle = const TextStyle(
  fontSize: 18.0,
  color: Color(0xFF13ACA6),
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w500,
);

TextStyle onboardingDescStyle = const TextStyle(
  fontSize: 15.0,
  color: Colors.black,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w500,
);

TextStyle headingStyle = TextStyle(
  fontSize: 18.0,
  color: blackColor,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w500,
);

TextStyle headingStyleWhite = TextStyle(
  fontSize: 18.0,
  color: whiteColor,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w500,
);

//style text untuk index sub judul//
TextStyle heading2 = TextStyle(
  fontSize: 14.0,
  color: bluepuloColor,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w500,
);
//style text untuk index sub judul warna hitam//
TextStyle heading2black = TextStyle(
  fontSize: 14.0,
  color: blackColor,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w400,
);
//style text untuk index sub judul warna putih//
TextStyle heading2white = TextStyle(
  fontSize: 14.0,
  color: whiteColor,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w400,
);
//style text untuk index sub judul hitam//
TextStyle heading2bold = TextStyle(
  fontSize: 14.0,
  color: blackColor,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.bold,
);
//style text untuk content
TextStyle heading3 = TextStyle(
  fontSize: 12.0,
  color: blackColor,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w400,
);

//style text tebal untuk content
TextStyle heading3bold = TextStyle(
  fontSize: 12.0,
  color: blackColor,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.bold,
);

//style text biru untuk content
TextStyle heading3blue = TextStyle(
  fontSize: 12.0,
  color: primaryColor,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w400,
);
//style text merah untuk content
TextStyle heading3red = const TextStyle(
  fontSize: 12.0,
  color: Colors.red,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w400,
);

//style text harga
TextStyle pricestyle = TextStyle(
  fontSize: 14.0,
  color: blackColor,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w400,
);

//style text harga bold
TextStyle pricebold = TextStyle(
  fontSize: 14.0,
  color: blackColor,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.bold,
);

//style text harga bold
TextStyle priceblue = TextStyle(
  fontSize: 14.0,
  color: bluepuloColor,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w500,
);

//style text harga bold
TextStyle pricebluebold = TextStyle(
  fontSize: 16.0,
  color: bluepuloColor,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.bold,
);

//text field(isian kotak)
TextStyle textfield = TextStyle(
  fontSize: 12.0,
  color: greyColor,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.normal,
);

TextStyle headingStylee = TextStyle(
  fontSize: 18.0,
  color: bluepuloColor,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w500,
);

TextStyle greyHeadingStyle = TextStyle(
  fontSize: 16.0,
  color: greyColor,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w500,
);

TextStyle blueTextStyle = const TextStyle(
  fontSize: 18.0,
  color: Colors.blue,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w400,
);

// Search text style start
TextStyle searchTextStyle = TextStyle(
  color: whiteColor.withOpacity(0.6),
  fontSize: 16.0,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w500,
);

TextStyle buttonWhite = TextStyle(
  fontSize: 14.0,
  color: whiteColor,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w500,
);

TextStyle buttonBlack = TextStyle(
  fontSize: 14.0,
  color: blackColor,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w500,
);

TextStyle moreStyle = TextStyle(
  fontSize: 12.0,
  color: primaryColor,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w500,
);
// TextStyle whiteHeadingStyle = TextStyle(
//   fontSize: 22.0,
//   color: whiteColor,
//   fontFamily: 'Roboto',
//   fontWeight: FontWeight.w500,
// );
//
// TextStyle whiteSubHeadingStyle = TextStyle(
//   fontSize: 14.0,
//   color: whiteColor,
//   fontFamily: 'Roboto',
//   fontWeight: FontWeight.normal,
// );

// List Item Style Start
// TextStyle listItemTitleStyle = TextStyle(
//   fontSize: 12.0,
//   color: blackColor,
//   fontFamily: 'Roboto',
//   fontWeight: FontWeight.w400,
// );
// TextStyle listItemSubTitleStyle = TextStyle(
//   fontSize: 14.0,
//   color: greyColor,
//   fontFamily: 'Roboto',
//   fontWeight: FontWeight.normal,
// );
// List Item Style End

// AppBar Style Start
TextStyle appbarHeadingStyle = TextStyle(
  color: greyColor,
  fontSize: 14.0,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w500,
);
TextStyle appbarSubHeadingStyle = TextStyle(
  color: whiteColor,
  fontSize: 13.0,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w500,
);
// AppBar Style End

// Search text style end

// Search History text style start

// Search History text style End

// Gaya tombol pertama (buttonPrimary)
final ButtonStyle buttonPrimary = ElevatedButton.styleFrom(
  minimumSize: const Size(155, 46),
  primary: red1,
  elevation: 0,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(50),
    ),
  ),
);

// Gaya tombol sekunder
final ButtonStyle buttonSecondary = ElevatedButton.styleFrom(
  minimumSize: const Size(155, 46),
  primary: red2,
  onPrimary: dark1,
  elevation: 0,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(50),
    ),
  ),
);

// Gaya tombol tersier dengan background warna tepi (buttonTertiary)
final ButtonStyle buttonTertiary = ElevatedButton.styleFrom(
  minimumSize: const Size(335, 46),
  primary: orange, // Menggunakan warna latar belakang oranye
  onPrimary: Colors.white,
  elevation: 0,
  shape: RoundedRectangleBorder(
    borderRadius: const BorderRadius.all(
      Radius.circular(50),
    ),
    side: BorderSide(
        color: orange), // Warna tepi disesuaikan dengan latar belakang
  ),
);

// Gaya tombol dengan shadow (buttonWithShadow)
final ButtonStyle buttonWithShadow = ElevatedButton.styleFrom(
  minimumSize: const Size(155, 46),
  primary: orange, // Menggunakan warna latar belakang oranye
  onPrimary: Colors.white,
  elevation: 2,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(50),
    ),
  ),
);

final ButtonStyle buttonNext = ElevatedButton.styleFrom(
  minimumSize: const Size(337, 46),
  textStyle: const TextStyle(
    fontSize: 16,
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w500,
    letterSpacing: 0.50,
  ),
  primary: blue1,
  elevation: 0,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(50),
    ),
  ),
);

final ButtonStyle buttonSimpan = ElevatedButton.styleFrom(
  minimumSize: const Size(400, 46),
  textStyle: const TextStyle(
    fontSize: 16,
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w500,
    letterSpacing: 0.50,
  ),
  primary: blue1,
  elevation: 0,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(50),
    ),
  ),
);

final ButtonStyle UploadGambar = ElevatedButton.styleFrom(
  minimumSize: const Size(337, 46),
  textStyle: const TextStyle(
    fontSize: 16,
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w500,
    letterSpacing: 0.50,
  ),
  primary: blue2,
  elevation: 0,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(50),
    ),
  ),
);
