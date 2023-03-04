import 'package:flutter/material.dart';

ThemeData commonThemeData() {
  final commonBackgroundColor = Colors.black.withOpacity(0.7);
  const commonFontColor = Color(0xFFE75480);

  return ThemeData(
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: Colors.amber,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 1,
      backgroundColor: commonBackgroundColor,
      unselectedItemColor: Colors.white,
      selectedItemColor: commonFontColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: commonBackgroundColor,
      titleTextStyle: const TextStyle(
        color: commonFontColor,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

PreferredSizeWidget buildAppBar({
  required String title,
  required BuildContext context,
}) {
  return AppBar(
    centerTitle: true,
    title: Text(
      title,
    ),
    leading: IconButton(
      icon: Icon(
        Navigator.canPop(context)
            ? Icons.arrow_back_ios_new_outlined
            : Icons.star_rounded,
      ),
      onPressed: () => {
        if (Navigator.canPop(context)) {Navigator.of(context).pop()}
      },
    ),
  );
}
