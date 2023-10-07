import 'package:flutter/material.dart';
import 'package:research_project/config/values/values.dart';
import 'package:research_project/presentation/widgets/spaces.dart';

class MemberCardData {
  final String title;
  final String description;
  final String imagePath;
  final String? institution;

  MemberCardData({
    required this.title,
    required this.imagePath,
    required this.description,
    this.institution,
  });
}

class MemberCard extends StatelessWidget {
  const MemberCard({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.width,
    required this.height,
    this.institution,
    this.titleStyle,
    this.descriptionStyle,
    this.elevation = Sizes.elevation4,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.backgroundColor = AppColors.white,
    this.onHoverChild,
  });

  final String title;
  final String description;
  final String imagePath;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;
  final String? institution;
  final double width;
  final double height;
  final double elevation;
  final BorderRadius borderRadius;
  final Color backgroundColor;
  final Widget? onHoverChild;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(borderRadius: borderRadius),
      child: Card(
        elevation: elevation,
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 370, maxHeight: 370),
          child: Container(
            key: const Key("default"),
            child: Padding(
              padding: const EdgeInsets.all(Sizes.padding10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(Sizes.padding6),
                    child: ClipRRect(
                      borderRadius: borderRadius,
                      child: Image.asset(
                        imagePath,
                        width: width,
                        height: height / 1.5,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SpaceH2(),
                  Expanded(
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: titleStyle ?? textTheme.titleMedium,
                      softWrap: true,
                    ),
                  ),
                  const SpaceH8(),
                  Expanded(
                    child: Text(
                      description,
                      style: descriptionStyle ??
                          textTheme.bodyMedium?.copyWith(
                            color: AppColors.primaryText1,
                          ),
                      textAlign: TextAlign.center,
                      /*   softWrap: true,
                      
                      maxLines: 2, */
                    ),
                  ),
                  const SpaceH8(),
                  institution != null
                      ? Expanded(
                          child: Text(
                            institution!,
                            style: descriptionStyle ??
                                textTheme.bodyMedium?.copyWith(
                                  color: AppColors.primaryText1,
                                  fontSize: 10,
                                ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
