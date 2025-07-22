import 'package:flutter/material.dart';

import 'dimensions.dart';

class Responsive extends StatefulWidget {
  const Responsive(
      {super.key,
      required this.mobileBody,
      required this.tabletBody,
      required this.destopBody});
  final Widget mobileBody;
  final Widget tabletBody;
  final Widget destopBody;

  @override
  State<Responsive> createState() => _ResponsiveState();
}

class _ResponsiveState extends State<Responsive> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < mobileWidth) {
          return widget.mobileBody;
        }
        if (constraints.maxWidth > mobileWidth) {
          return widget.destopBody;
        } else {
          return widget.tabletBody;
        }
      },
    );
  }
}
