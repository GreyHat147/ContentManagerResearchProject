import 'package:flutter/material.dart';
import 'package:research_project/config/values/values.dart';
import 'package:research_project/presentation/layout/adaptative.dart';
import 'package:research_project/presentation/widgets/empty.dart';
import 'package:research_project/presentation/widgets/spaces.dart';

class NimbusInfoSection1 extends StatelessWidget {
  final String sectionTitle;
  final String title1;
  final String title2;
  final bool hasTitle2;
  final String body;
  final TextStyle? sectionTitleStyle;
  final TextStyle? title1Style;
  final TextStyle? title2Style;
  final TextStyle? bodyStyle;
  final Color dividerColor;
  final double? thickness;
  final int quarterTurns;
  final double dividerHeight;
  final Widget? child;
  final Widget? newImage;

  const NimbusInfoSection1({
    super.key,
    required this.sectionTitle,
    required this.title1,
    required this.body,
    this.title2 = "",
    this.sectionTitleStyle,
    this.title1Style,
    this.hasTitle2 = true,
    this.title2Style,
    this.bodyStyle,
    this.thickness = 1.15,
    this.quarterTurns = 3,
    this.dividerColor = AppColors.grey350,
    this.dividerHeight = Sizes.height40,
    this.child,
    this.newImage,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? titleStyle = textTheme.displaySmall?.copyWith(
      fontSize: responsiveSize(context, 26, 36, md: 32),
    );
    double fontSize = responsiveSize(context, 16, 18);
    return IntrinsicHeight(
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RotatedBox(
                quarterTurns: quarterTurns,
                child: Text(
                  sectionTitle,
                  style: textTheme.bodyMedium?.copyWith(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey250,
                  ),
                ),
              ),
              const SpaceH16(),
              SizedBox(
                height: dividerHeight,
                child: VerticalDivider(
                  color: dividerColor,
                  thickness: thickness,
                ),
              ),
            ],
          ),
          const SpaceW16(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title1,
                          style: title1Style ?? titleStyle,
                        ),
                        hasTitle2
                            ? SizedBox(
                                height: responsiveSize(
                                  context,
                                  Sizes.height4,
                                  Sizes.height16,
                                  md: Sizes.height8,
                                ),
                              )
                            : const Empty(),
                        hasTitle2
                            ? Text(
                                title2,
                                style: title2Style ?? titleStyle,
                              )
                            : const Empty(),
                      ],
                    ),
                    if (newImage != null) newImage!,
                  ],
                ),
                Text(
                  body,
                  style: textTheme.bodyLarge
                      ?.copyWith(fontSize: fontSize, height: 1.8),
                ),
                const SpaceH20(),
                child != null ? const SpaceH30() : const Empty(),
                child ?? const Empty(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NimbusInfoSection2 extends StatelessWidget {
  final String sectionTitle;
  final String title1;
  final String title2;
  final bool hasTitle2;
  final String body;
  final TextStyle? sectionTitleStyle;
  final TextStyle? title1Style;
  final TextStyle? title2Style;
  final TextStyle? bodyStyle;
  final Color dividerColor;
  final double? thickness;
  final double dividerWidth;
  final Widget? child;

  const NimbusInfoSection2({
    super.key,
    required this.sectionTitle,
    required this.title1,
    required this.body,
    this.title2 = "",
    this.sectionTitleStyle,
    this.title1Style,
    this.hasTitle2 = true,
    this.title2Style,
    this.bodyStyle,
    this.thickness = 1.15,
    this.dividerColor = AppColors.grey350,
    this.dividerWidth = Sizes.height64,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? titleStyle = textTheme.displaySmall?.copyWith(
      fontSize: responsiveSize(context, 26, 48, md: 32),
    );
    double fontSize = responsiveSize(context, 16, 18);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: dividerWidth,
              child: Divider(
                color: dividerColor,
                thickness: thickness,
              ),
            ),
            const SpaceW16(),
            Text(
              sectionTitle,
              style: textTheme.bodyMedium?.copyWith(
                fontSize: fontSize,
                fontWeight: FontWeight.w400,
                color: AppColors.grey250,
              ),
            ),
          ],
        ),
        const SpaceH16(),
        Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title1,
              style: title1Style ?? titleStyle,
            ),
            hasTitle2
                ? SizedBox(
                    height: responsiveSize(
                      context,
                      Sizes.height4,
                      Sizes.height16,
                      md: Sizes.height8,
                    ),
                  )
                : const Empty(),
            hasTitle2
                ? Text(
                    title2,
                    style: title2Style ?? titleStyle,
                  )
                : const Empty(),
            const SpaceH20(),
            Text(
              body,
              style: textTheme.bodyLarge
                  ?.copyWith(fontSize: fontSize, height: 1.8),
            ),
            child != null ? const SpaceH30() : const Empty(),
            child ?? const Empty(),
          ],
        ),
      ],
    );
  }
}
