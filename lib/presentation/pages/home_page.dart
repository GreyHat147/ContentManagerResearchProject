import 'package:flutter/material.dart';
import 'package:research_project/config/values/values.dart';
import 'package:research_project/presentation/pages/layout_template.dart';
import 'package:research_project/presentation/pages/sections/about_section/about_section.dart';
import 'package:research_project/presentation/pages/sections/header_section/header_section.dart';
import 'package:research_project/presentation/widgets/spaces.dart';

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
          const Column(
            children: [
              HeaderSection(),
              AboutSection(),
              SpaceH100(),
            ],
          )
        ],
      ),
    );
  }
}
