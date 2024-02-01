import 'package:flutter/material.dart';

// Colors
Color green1 = const Color(0xff00880F);
Color green2 = Color.fromARGB(255, 3, 189, 25);
Color white = Color(0xffFFFFFF);

Color dark1 = const Color(0xFF1C1C1C);
Color dark2 = const Color(0xFF4A4A4A);
Color dark3 = const Color(0xFF999798);
Color dark4 = const Color(0xFFEDEDED);

Color blue1 = const Color(0xFF0281A0);
Color blue2 = const Color(0xFF00AED5);
Color blue3 = const Color(0xFF38BBDA);

Color red1 = const Color(0xFF2e345d);
Color red2 = const Color(0xff6770a9);
Color orange = const Color(0xFFFFA500);
Color purple = const Color(0xFF87027B);

// Typography
TextStyle regular12_5 =
    const TextStyle(fontFamily: 'SF-Pro-Display', fontSize: 12.5);
TextStyle regular14 = regular12_5.copyWith(fontSize: 14);
TextStyle regular16 = regular12_5.copyWith(fontSize: 16);
TextStyle regular10 = regular12_5.copyWith(fontSize: 10);

TextStyle semibold12_5 = regular12_5.copyWith(fontWeight: FontWeight.w600);
TextStyle semibold14 = semibold12_5.copyWith(fontSize: 14, letterSpacing: 0.1);

TextStyle bold16 = regular12_5.copyWith(
    fontWeight: FontWeight.w700, fontSize: 16, letterSpacing: 0.1);
TextStyle bold18 = bold16.copyWith(fontSize: 18, letterSpacing: -0.5);
