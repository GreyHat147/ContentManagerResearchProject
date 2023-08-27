import 'package:flutter/material.dart';
import 'package:research_project/presentation/pages/sections/nav_section/nav_section_mobile.dart';
import 'package:research_project/presentation/pages/sections/nav_section/nav_section_web.dart';
import 'package:research_project/presentation/widgets/nav_item.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NavSection extends StatelessWidget {
  const NavSection({
    super.key,
    required this.navItems,
    required this.scaffoldKey,
  });

  final List<NavItemData> navItems;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      refinedBreakpoints: const RefinedBreakpoints(),
      builder: (context, sizingInformation) {
        double screenWidth = sizingInformation.screenSize.width;
        if (screenWidth < const RefinedBreakpoints().desktopSmall) {
          return NavSectionMobile(scaffoldKey: scaffoldKey);
        } else {
          return NavSectionWeb(
            navItems: navItems,
          );
        }
      },
    );
  }
}
