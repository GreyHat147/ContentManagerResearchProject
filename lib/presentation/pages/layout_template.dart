import 'package:flutter/material.dart';
import 'package:research_project/config/values/values.dart';
import 'package:research_project/presentation/layout/adaptative.dart';
import 'package:research_project/presentation/pages/home_page.dart';
import 'package:research_project/presentation/pages/project_page.dart';
import 'package:research_project/presentation/pages/sections/footer_section.dart';
import 'package:research_project/presentation/pages/sections/nav_section/nav_section.dart';
import 'package:research_project/presentation/pages/team_page.dart';
import 'package:research_project/presentation/routing/routes_names.dart';
import 'package:research_project/presentation/widgets/app_drawer.dart';
import 'package:research_project/presentation/widgets/nav_item.dart';
import 'package:research_project/presentation/widgets/spaces.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LayoutTemplate extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();
  final Widget child;

  final List<NavItemData> navItems = [
    NavItemData(
        name: StringsConst.home, key: GlobalKey(), routeName: homeRoute),
    NavItemData(
        name: StringsConst.project, key: GlobalKey(), routeName: projectRoute),
    NavItemData(
      name: StringsConst.team,
      key: GlobalKey(),
      routeName: teamRoute,
    ),
    NavItemData(
      name: StringsConst.content,
      key: GlobalKey(),
      routeName: newsRoute,
    ),
    NavItemData(
      name: StringsConst.publications,
      key: GlobalKey(),
      routeName: publicationsRoute,
    ),
  ];

  LayoutTemplate({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = heightOfScreen(context);
    double spacerHeight = screenHeight * 0.05;

    return Scaffold(
      key: _scaffoldKey,
      drawer: ResponsiveBuilder(
        refinedBreakpoints: const RefinedBreakpoints(),
        builder: (context, sizingInformation) {
          double screenWidth = sizingInformation.screenSize.width;
          if (screenWidth < const RefinedBreakpoints().desktopSmall) {
            return AppDrawer(
              menuList: navItems,
            );
          } else {
            return Container();
          }
        },
      ),
      body: Column(
        children: [
          NavSection(navItems: navItems, scaffoldKey: _scaffoldKey),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  child,
                  //const SpaceH100(),
                  const FooterSection(),
                  SizedBox(height: spacerHeight),
                  Text(
                    'Algunas de las imagenes de este sitio web fueron generadas con: https://www.craiyon.com',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  SizedBox(height: spacerHeight),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
