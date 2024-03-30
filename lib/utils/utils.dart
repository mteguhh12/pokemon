import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

T? castOrNull<T>(dynamic x) => x is T ? x : null;

T castOrFallback<T>(dynamic x, T fallback) => x is T ? x : fallback;

class Utils {
  static void onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }

  static bool isEmpty(Object? text) {
    if (text is String) return text.isEmpty;
    if (text is List) return text.isEmpty;
    return text == null;
  }
}
