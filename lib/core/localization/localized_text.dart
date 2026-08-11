import 'package:flutter/material.dart';

/// A translatable string keyed by locale code, e.g. {'en': 'Hello', 'hi': 'नमस्ते'}.
typedef LocalizedText = Map<String, String>;

extension LocalizedTextX on LocalizedText {
  /// Resolves this text for the given locale, falling back to English,
  /// then to whatever's available, so missing translations never crash
  /// or show blank text.
  String resolve(Locale locale) {
    return this[locale.languageCode] ?? this['en'] ?? values.first;
  }

  /// Convenience for resolving directly from a BuildContext.
  String of(BuildContext context) => resolve(Localizations.localeOf(context));
}
