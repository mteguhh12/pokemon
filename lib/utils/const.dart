import 'dart:ui';

class Const {
  // locales
  static const String LOCALE_EN = "en"; // accept: en, en-US
  static const String LOCALE_EN_SHORT = "en_short";
  static const String LOCALE_IN = "id"; // accept: in, in-ID
  static const List<String> LIST_LOCALE = [LOCALE_EN, LOCALE_IN];

  static const String ACTION_REFRESH = "Refresh";
}

class AppColors {
  static const primaryColor = Color.fromRGBO(252, 238, 200, 1);
  static const darkGray = Color(0xFF555555);
}

class AppImages {
  static String ic_empty_state = 'assets/ic_empty_state.png';
  static String pokeball = 'assets/pokeball.png';
}
