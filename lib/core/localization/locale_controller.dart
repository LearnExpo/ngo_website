import 'package:flutter/material.dart';

/// App-wide locale controller. Wrap the app once in main.dart with
/// [LocaleControllerScope]; any widget can then read the current locale
/// or call `.setLocale(...)` to change language instantly everywhere
/// (e.g. from the nav bar's language switcher).
class LocaleController extends ChangeNotifier {
  Locale _locale = const Locale('en');
  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (_locale == locale) return;
    _locale = locale;
    notifyListeners();
  }
}

class LocaleControllerScope extends InheritedNotifier<LocaleController> {
  const LocaleControllerScope({
    super.key,
    required LocaleController controller,
    required super.child,
  }) : super(notifier: controller);

  static LocaleController of(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<LocaleControllerScope>();
    assert(scope != null, 'No LocaleControllerScope found in context');
    return scope!.notifier!;
  }
}