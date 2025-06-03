import 'package:flutter/material.dart';


class OrientationLayout extends StatelessWidget {
  const OrientationLayout({
    super.key,
    required this.portrait,
    this.landscape,
  });

  final Widget portrait;
  final Widget? landscape;

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    if (orientation == Orientation.landscape && landscape != null) {
      return landscape!;
    }

    return portrait;
  }
}
