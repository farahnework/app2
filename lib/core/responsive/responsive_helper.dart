import 'package:flutter/material.dart';

/// RESPONSIVE SYSTEM - CORE TYPES AND UTILITIES
///
/// This file defines the fundamental types and widgets for responsive design:
/// - DeviceScreenType enum (mobile, tablet, desktop)
/// - ScreenTypeLayout widget for device-specific layouts
/// - Helper functions for determining device types
///
/// This file is imported by context_extension.dart and provides the foundation
/// for all device type detection in the application.

/// Enum defining different device screen types
enum DeviceScreenType { mobile, tablet, desktop }

/// Widget that provides different layouts based on screen type
class ScreenTypeLayout extends StatelessWidget {
  const ScreenTypeLayout({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  @override
  Widget build(BuildContext context) {
    final deviceType = getDeviceType(context);

    switch (deviceType) {
      case DeviceScreenType.desktop:
        return desktop ?? tablet ?? mobile;
      case DeviceScreenType.tablet:
        return tablet ?? mobile;
      case DeviceScreenType.mobile:
        return mobile;
    }
  }
}

/// Get the device type based on screen width
DeviceScreenType getDeviceType(BuildContext context) {
  final width = MediaQuery.of(context).size.width;

  if (width >= 1100) {
    return DeviceScreenType.desktop;
  } else if (width >= 600) {
    return DeviceScreenType.tablet;
  } else {
    return DeviceScreenType.mobile;
  }
}

/// Helper function to get value based on screen type
T getValueForScreenType<T>({
  required T mobile,
  T? tablet,
  T? desktop,
  required BuildContext context,
}) {
  final deviceType = getDeviceType(context);

  switch (deviceType) {
    case DeviceScreenType.desktop:
      return desktop ?? tablet ?? mobile;
    case DeviceScreenType.tablet:
      return tablet ?? mobile;
    case DeviceScreenType.mobile:
      return mobile;
  }
}

/// Extension methods for DeviceScreenType
extension DeviceScreenTypeExtension on DeviceScreenType {
  bool isSmall() => this == DeviceScreenType.mobile;
  bool isMedium() => this == DeviceScreenType.tablet;
  bool isSemiLarge() => this == DeviceScreenType.desktop;
  bool isLarge() => this == DeviceScreenType.desktop;
}
