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
  aquire,
  aquireTitle1,
  aquireTitle2,
  aquireTitle3,
}

extension TextStylesExtension on TextStyles {
  TextStyle get style {
    switch (this) {
      case TextStyles.aquire:
        return const TextStyle(fontSize: 22.0, fontFamily: 'Aquire');
      case TextStyles.aquireTitle1:
        return const TextStyle(fontSize: 32.0, fontFamily: 'Aquire');
      case TextStyles.aquireTitle2:
        return const TextStyle(fontSize: 28.0, fontFamily: 'Aquire');
      case TextStyles.aquireTitle3:
        return const TextStyle(fontSize: 22.0, fontFamily: 'Aquire');
    }
  }
}

final ThemeData _themeLight = ThemeData.light();
final ThemeData _themeDark = ThemeData.dark();

final appTheme = _themeLight.copyWith(
  colorScheme: _themeLight.colorScheme.copyWith(
    primary: ThemeColor.primaryGreen.color,
  ),
  textTheme: _themeLight.textTheme
      .copyWith(
        caption: TextStyles.aquire.style,
      )
      .apply(
        bodyColor: Colors.black,
        displayColor: ThemeColor.primaryGreen.color,
      ),
  scaffoldBackgroundColor: ThemeColor.primaryBackground.color,
  brightness: Brightness.light,
);

final appThemeDark = _themeDark.copyWith(
  colorScheme: _themeDark.colorScheme.copyWith(
    primary: ThemeColor.primaryGreen.color,
  ),
  textTheme: _themeLight.textTheme
      .copyWith(
        caption: TextStyles.aquire.style,
      )
      .apply(
        bodyColor: Colors.white,
        displayColor: ThemeColor.green4.color,
      ),
  scaffoldBackgroundColor: Colors.black,
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
