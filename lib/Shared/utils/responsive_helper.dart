import 'package:flutter/material.dart';

class ResponsiveHelper {
  // Screen breakpoints
  static const double mobileMaxWidth = 600;
  static const double tabletMaxWidth = 1024;
  static const double desktopMinWidth = 1025;

  // Check device type
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < mobileMaxWidth;
  }

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= mobileMaxWidth && width < desktopMinWidth;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= desktopMinWidth;
  }

  // Get responsive value based on screen size
  static T getValue<T>(
    BuildContext context, {
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    if (isDesktop(context) && desktop != null) {
      return desktop;
    } else if (isTablet(context) && tablet != null) {
      return tablet;
    }
    return mobile;
  }

  // Get responsive padding
  static EdgeInsets getPagePadding(BuildContext context) {
    if (isDesktop(context)) {
      return const EdgeInsets.symmetric(horizontal: 120, vertical: 32);
    } else if (isTablet(context)) {
      return const EdgeInsets.symmetric(horizontal: 40, vertical: 24);
    }
    return const EdgeInsets.symmetric(horizontal: 16, vertical: 16);
  }

  // Get card padding
  static EdgeInsets getCardPadding(BuildContext context) {
    if (isDesktop(context)) {
      return const EdgeInsets.all(24);
    } else if (isTablet(context)) {
      return const EdgeInsets.all(20);
    }
    return const EdgeInsets.all(16);
  }

  // Get grid columns
  static int getGridColumns(BuildContext context) {
    if (isDesktop(context)) {
      return 3;
    } else if (isTablet(context)) {
      return 2;
    }
    return 1;
  }

  // Get max content width for web
  static double getMaxContentWidth(BuildContext context) {
    return isDesktop(context) ? 1400 : double.infinity;
  }

  // Get spacing
  static double getSpacing(
    BuildContext context, {
    double mobile = 16,
    double tablet = 20,
    double desktop = 24,
  }) {
    if (isDesktop(context)) return desktop;
    if (isTablet(context)) return tablet;
    return mobile;
  }
}

// Responsive layout builder widget
class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  const ResponsiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= ResponsiveHelper.desktopMinWidth) {
          return desktop ?? tablet ?? mobile;
        } else if (constraints.maxWidth >= ResponsiveHelper.mobileMaxWidth) {
          return tablet ?? mobile;
        }
        return mobile;
      },
    );
  }
}
