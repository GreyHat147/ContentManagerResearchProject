import 'package:flutter/material.dart';
import 'package:research_project/config/values/values.dart';
import 'package:research_project/presentation/layout/adaptative.dart';
import 'package:research_project/presentation/pages/layout_template.dart';
import 'package:research_project/presentation/widgets/bullet_text.dart';
import 'package:research_project/presentation/widgets/spaces.dart';

class ProjectPage extends StatelessWidget {
  ProjectPage({super.key});

  final List specificObejtivesTexts = [
    StringsConst.projectPageSpecifcObjective1,
    StringsConst.projectPageSpecifcObjective2,
    StringsConst.projectPageSpecifcObjective3,
    StringsConst.projectPageSpecifcObjective4,
    StringsConst.projectPageSpecifcObjective5,
    StringsConst.projectPageSpecifcObjective6,
  ];

  List<Widget> _buildSpecificObjetives() {
    List<Widget> items = [];
    for (int index = 0; index < specificObejtivesTexts.length; index++) {
      items.add(TextWithBullet(text: specificObejtivesTexts[index]));
      items.add(const SpaceH30());
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double fontSize = responsiveSize(context, 16, 18);

    return LayoutTemplate(
      child: Stack(
        children: [
          Positioned(
            top: assignWidth(context, 0.1),
            left: -assignWidth(context, 0.05),
            child: Image.asset(ImagePath.blobFemurAsh),
          ),
          Positioned(
            right: -assignWidth(context, 0.5),
            child: Image.asset(ImagePath.blobSmallBeanAsh),
          ),
          Container(
            padding: EdgeInsets.only(
              left: getSidePadding(context),
              right: getSidePadding(context),
            ),
            child: Column(
              children: [
                const SpaceH100(),
                Text(
                  StringsConst.projectPageTitle,
                  style: textTheme.displaySmall?.copyWith(
                    fontSize: responsiveSize(context, 26, 36, md: 32),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SpaceH30(),
                Text(
                  StringsConst.projectPageDescription,
                  style: textTheme.bodyLarge
                      ?.copyWith(fontSize: fontSize, height: 1.8),
                  textAlign: TextAlign.justify,
                ),
                const SpaceH50(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    StringsConst.projectPageObjectiveTitle,
                    style: textTheme.displaySmall?.copyWith(
                      fontSize: responsiveSize(context, 26, 36, md: 32),
                    ),
                  ),
                ),
                const SpaceH30(),
                Text(
                  StringsConst.projectPageObjectiveDescription,
                  style: textTheme.bodyLarge
                      ?.copyWith(fontSize: fontSize, height: 1.8),
                  textAlign: TextAlign.justify,
                ),
                const SpaceH50(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    StringsConst.projectPageSpecifcObjectivesTitle,
                    style: textTheme.titleLarge?.copyWith(
                      color: AppColors.black,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                const SpaceH30(),
                ..._buildSpecificObjetives(),
                const SpaceH80(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
