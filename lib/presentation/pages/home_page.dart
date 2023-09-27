import 'package:flutter/material.dart';
import 'package:research_project/config/values/values.dart';
import 'package:research_project/presentation/pages/layout_template.dart';
import 'package:research_project/presentation/pages/sections/about_section/about_section.dart';
import 'package:research_project/presentation/pages/sections/header_section/header_section.dart';
import 'package:visibility_detector/visibility_detector.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutTemplate(
      child: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(ImagePath.blobBeanAsh),
            ),
          ),
          Column(
            children: [
              HeaderSection(
                  //key: navItems[0].key,
                  ),
              //SizedBox(height: spacerHeight),
              VisibilityDetector(
                key: const Key("the_project"),
                onVisibilityChanged: (visibilityInfo) {
                  double visiblePercentage =
                      visibilityInfo.visibleFraction * 100;
                  if (visiblePercentage > 10) {
                    // _controller.forward();
                  }
                },
                child: Container(
                  //key: navItems[1].key,
                  child: const AboutSection(),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
