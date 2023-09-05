import 'package:flutter/material.dart';
import 'package:research_project/config/values/values.dart';
import 'package:research_project/presentation/widgets/empty.dart';
import 'package:research_project/presentation/widgets/nimbus_info_section.dart';
import 'package:research_project/presentation/widgets/spaces.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ContentInfo extends StatelessWidget {
  const ContentInfo({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Stack(
      children: [
        //positions blob on the far right of the section
        //based on the calculation only 10% of blob is showing
        Positioned(
          top: height * 0.2,
          left: width * 0.90,
          child: ResponsiveBuilder(
            refinedBreakpoints: const RefinedBreakpoints(),
            builder: (context, sizingInformation) {
              double screenWidth = sizingInformation.screenSize.width;
              if (screenWidth < (const RefinedBreakpoints().tabletLarge)) {
                return const Empty();
              } else {
                return Image.asset(
                  ImagePath.blobBlack,
                  height: height * 0.30,
                  width: width * 0.30,
                );
              }
            },
          ),
        ),

        ResponsiveBuilder(
          refinedBreakpoints: const RefinedBreakpoints(),
          builder: (context, sizingInformation) {
            double screenWidth = sizingInformation.screenSize.width;
            if (screenWidth < (const RefinedBreakpoints().tabletNormal)) {
              return const NimbusInfoSection2(
                sectionTitle: StringsConst.aboutTag,
                title1: StringsConst.aboutTitle,
                hasTitle2: false,
                body: StringsConst.aboutDescription,
              );
            } else {
              //This container takes 85% of the space and leave 15% as spacing
              //between the blob and the content
              return SizedBox(
                width: width * 0.85,
                child: const Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          NimbusInfoSection1(
                            sectionTitle: StringsConst.aboutTag,
                            title1: StringsConst.aboutTitle,
                            hasTitle2: false,
                            body: StringsConst.aboutDescription,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
