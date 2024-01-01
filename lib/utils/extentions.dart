import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

extension BuildContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
  ScaffoldState get scaffoldContext => Scaffold.of(this);
  MediaQueryData get mediaQueryContext => MediaQuery.of(this);
  Size get querySize => mediaQueryContext.size;
  ResponsiveBreakpointsData get responsiveBreakpoints =>
      ResponsiveBreakpoints.of(this);
}
