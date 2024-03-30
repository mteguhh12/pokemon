import 'package:collection/collection.dart';

class AppConfig {
  static final Environment environment = _load();

  static Environment _load() {
    const env = String.fromEnvironment("POKEMON_ENV");
    return Environment.values
            .firstWhereOrNull((element) => element.name == env) ??
        Environment.STAGING;
  }
}

enum Environment {
  STAGING,
  PRODUCTION,
}

extension EnvironmentExt on Environment {
  String get suffix {
    switch (this) {
      case Environment.STAGING:
        //return ".stg";
        return "";
      case Environment.PRODUCTION:
        return "";
    }
  }

  String get clientId {
    switch (this) {
      case Environment.STAGING:
        return "mobile-app-client";
      case Environment.PRODUCTION:
        return "mobile-app-client";
    }
  }

  String get apiEndpoint {
    switch (this) {
      case Environment.STAGING:
        return "https://pokeapi.co/api/v2/";
      case Environment.PRODUCTION:
        return "https://pokeapi.co/api/v2/";
    }
  }

  String get authEndpoint {
    switch (this) {
      case Environment.STAGING:
        return "https://pokeapi.co/api/v2/";
      case Environment.PRODUCTION:
        return "https://pokeapi.co/api/v2/";
    }
  }

  String get logoutEndpoint {
    switch (this) {
      case Environment.STAGING:
        return "https://pokeapi.co/api/v2/";
      case Environment.PRODUCTION:
        return "https://pokeapi.co/api/v2/";
    }
  }
}
