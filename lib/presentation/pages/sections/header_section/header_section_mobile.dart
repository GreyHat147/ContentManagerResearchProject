import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:research_project/config/values/values.dart';
import 'package:research_project/presentation/layout/adaptative.dart';
import 'package:research_project/presentation/widgets/content_area.dart';
import 'package:research_project/presentation/widgets/header_image.dart';
import 'package:research_project/presentation/widgets/spaces.dart';

const double bodyTextSizeLg = 16.0;
const double bodyTextSizeSm = 14.0;
const double socialTextSizeLg = 18.0;
const double socialTextSizeSm = 14.0;
const double sidePadding = Sizes.padding16;

class HeaderSectionMobile extends StatefulWidget {
  const HeaderSectionMobile({Key? key}) : super(key: key);

  @override
  State<HeaderSectionMobile> createState() => _HeaderSectionMobileState();
}

class _HeaderSectionMobileState extends State<HeaderSectionMobile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();

    _controller.forward();
    _controller.addListener(() {
      if (_controller.status == AnimationStatus.completed) {
        _controller.reset();
        _controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double headerIntroTextSize = Sizes.textSize24;
    double screenWidth = widthOfScreen(context) - (sidePadding * 2);
    double sizeOfBlobSm = screenWidth * 0.4;
    double sizeOfGoldenGlobe = screenWidth * 0.3;
    double dottedGoldenGlobeOffset = sizeOfBlobSm * 0.4;
    double heightOfBlobAndGlobe =
        computeHeight(dottedGoldenGlobeOffset, sizeOfGoldenGlobe, sizeOfBlobSm);
    double heightOfStack = heightOfBlobAndGlobe * 2;

    return ContentArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                margin: EdgeInsets.only(top: heightOfStack * 0.3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: screenWidth),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            StringsConst.headerTitle,
                            speed: const Duration(milliseconds: 100),
                            textStyle: textTheme.displayMedium?.copyWith(
                              fontSize: headerIntroTextSize,
                            ),
                          ),
                        ],
                        onTap: () {},
                        isRepeatingAnimation: true,
                        totalRepeatCount: 5,
                      ),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: screenWidth),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            StringsConst.headerSubtitle,
                            speed: const Duration(milliseconds: 120),
                            textStyle: textTheme.displayMedium?.copyWith(
                              fontSize: headerIntroTextSize,
                              color: AppColors.primaryColor,
                              height: 1.2,
                            ),
                          ),
                        ],
                        onTap: () {},
                        isRepeatingAnimation: true,
                        totalRepeatCount: 5,
                      ),
                    ),
                    const SpaceH16(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
