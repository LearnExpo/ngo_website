/// Simple, explicit breakpoints used across the whole site instead of
/// pulling in a heavy responsive package. Keeps behavior predictable.
class Breakpoints {
  Breakpoints._();

  static const double mobile = 600;
  static const double tablet = 1024;
  static const double desktop = 1440;

  static bool isMobile(double width) => width < mobile;
  static bool isTablet(double width) => width >= mobile && width < tablet;
  static bool isDesktop(double width) => width >= tablet;

  /// Max content width so text/sections don't stretch edge-to-edge on
  /// very large monitors.
  static const double maxContentWidth = 1200;
}
