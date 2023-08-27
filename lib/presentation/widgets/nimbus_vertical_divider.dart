import 'package:flutter/material.dart';
import 'package:research_project/config/values/values.dart';

class NimbusVerticalDivider extends StatelessWidget {
  const NimbusVerticalDivider({
    super.key,
    this.thickness = 0.8,
    this.width,
    this.color = AppColors.black,
  });

  final double? width;
  final double thickness;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return VerticalDivider(thickness: thickness);
  }
}
