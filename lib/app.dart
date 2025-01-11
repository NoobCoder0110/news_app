import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/main/screens/home/home.dart';
import 'utils/constants/colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const HomeScreen(),
      theme: ThemeData().copyWith(
        colorScheme: const ColorScheme.light().copyWith(primary: CColors.primary,surface: CColors.grey),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: const TextStyle(
                // fontWeight: FontWeight.bold,
                color: CColors.black,
                fontSize: 24,
              ),
              bodyLarge: const TextStyle(
                color: CColors.black,
                fontSize: 18,
              ),
              bodyMedium: const TextStyle(
                color: CColors.black,
                fontSize: 16,
              ),
            ),
      ),
      darkTheme: ThemeData.dark().copyWith(
         colorScheme: const ColorScheme.light().copyWith(primary: CColors.darkPrimary, surface: CColors.white),
      ),
    );
  }
}
