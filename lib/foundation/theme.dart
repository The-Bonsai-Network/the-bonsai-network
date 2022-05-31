import 'package:flutter/material.dart';

enum ThemeColor {
  primaryGreen,
  primaryBackground,
  green1,
  green2,
  green3,
  green4,
  green5,
}

extension ThemeColorExtension on ThemeColor {
  Color get color {
    switch (this) {
      case ThemeColor.primaryGreen:
        return const Color(0xFF284635);
      case ThemeColor.primaryBackground:
        return const Color(0xFFD5D8D1);
      case ThemeColor.green1:
        return const Color(0xFF3B6445);
      case ThemeColor.green2:
        return const Color(0xFF52774D);
      case ThemeColor.green3:
        return const Color(0xFF6C934C);
      case ThemeColor.green4:
        return const Color(0xFF8BAF56);
      case ThemeColor.green5:
        return const Color(0xFFBADE59);
      default:
        return const Color(0xFF284635);
    }
  }
}

class AppThemeData extends ChangeNotifier {
  ThemeMode _mode = ThemeMode.system;
  ThemeMode get mode => _mode;
  set mode(ThemeMode mode) {
    _mode = mode;
    notifyListeners();
  }
}

enum TextStyles {
  gilroy,
}

extension TextStylesExtension on TextStyles {
  TextStyle get style {
    switch (this) {
      case TextStyles.gilroy:
        return const TextStyle(
          fontSize: 22.0,
          fontFamily: 'Gilroy',
          color: Colors.black,
        );
    }
  }
}

final ThemeData _themeLight = ThemeData.light();
// final ThemeData _themeDark = ThemeData.dark();

final appTheme = _themeLight.copyWith(
  colorScheme: _themeLight.colorScheme.copyWith(
    primary: Colors.blue,
  ),
  textTheme: _themeLight.textTheme.copyWith(
    caption: TextStyles.gilroy.style,
  ),
  canvasColor: const Color(0xFFE5E5E5),
  backgroundColor: const Color(0xFFE5E5E5),
  brightness: Brightness.light,
);

final appThemeDark = _themeLight.copyWith(
  colorScheme: _themeLight.colorScheme.copyWith(
    primary: Colors.blue,
  ),
  textTheme: _themeLight.textTheme.copyWith(
    caption: TextStyles.gilroy.style,
  ),
  brightness: Brightness.dark,
);

ButtonStyle get elevatedButtonStyle => ElevatedButton.styleFrom(
      primary: ThemeColor.primaryGreen.color,
      minimumSize: const Size(250, 45),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
    );

ButtonStyle elevatedButtonStyleWith({
  required Color color,
  required Radius radius,
}) {
  return ElevatedButton.styleFrom(
    primary: color,
    minimumSize: const Size(250, 45),
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
  );
}
