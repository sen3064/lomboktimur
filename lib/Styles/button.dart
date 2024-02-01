import 'package:flutter/material.dart';
import 'package:kolaka/theme.dart';

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
  primary: red1,
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
  primary: red1,
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
  primary: red2,
  elevation: 0,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(50),
    ),
  ),
);
