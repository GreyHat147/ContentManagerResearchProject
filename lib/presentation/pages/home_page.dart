import 'package:flutter/material.dart';
import 'package:research_project/config/values/values.dart';
import 'package:research_project/presentation/layout/adaptative.dart';
import 'package:research_project/presentation/pages/project_page.dart';
import 'package:research_project/presentation/pages/sections/about_section/about_section.dart';
import 'package:research_project/presentation/pages/sections/footer_section.dart';
import 'package:research_project/presentation/pages/sections/header_section/header_section.dart';
import 'package:research_project/presentation/pages/sections/nav_section/nav_section.dart';
import 'package:research_project/presentation/widgets/app_drawer.dart';
import 'package:research_project/presentation/widgets/nav_item.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:visibility_detector/visibility_detector.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 300),
    vsync: this,
  );

  final List<NavItemData> navItems = [
    NavItemData(name: StringsConst.home, key: GlobalKey(), isSelected: true),
    NavItemData(name: StringsConst.project, key: GlobalKey()),
    NavItemData(name: StringsConst.team, key: GlobalKey()),
    NavItemData(name: StringsConst.content, key: GlobalKey()),
    NavItemData(name: StringsConst.publications, key: GlobalKey()),
  ];

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels < 100) {
        _controller.reverse();
      }
    });
    super.initState();
  }

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
                  /* Stack(
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
                            key: navItems[0].key,
                          ),
                          SizedBox(height: spacerHeight),
                          VisibilityDetector(
                            key: const Key("the_project"),
                            onVisibilityChanged: (visibilityInfo) {
                              double visiblePercentage =
                                  visibilityInfo.visibleFraction * 100;
                              if (visiblePercentage > 10) {
                                _controller.forward();
                              }
                            },
                            child: Container(
                              key: navItems[1].key,
                              child: const AboutSection(),
                            ),
                          ),
                        ],
                      )
                    ],
                  ), */
                  ProjectPage(),
                  SizedBox(height: spacerHeight),
                  /*  Stack(
                    children: [
                      Positioned(
                        top: assignWidth(context, 0.1),
                        left: -assignWidth(context, 0.05),
                        child: Image.asset(ImagePath.BLOB_FEMUR_ASH),
                      ),
                      Positioned(
                        right: -assignWidth(context, 0.5),
                        child: Image.asset(ImagePath.BLOB_SMALL_BEAN_ASH),
                      ),
                      Column(
                        children: [
                          Container(
                            key: navItems[2].key,
                            child: SkillsSection(),
                          ),
                          SizedBox(height: spacerHeight),
                          StatisticsSection(),
                          SizedBox(height: spacerHeight),
                          Container(
                            key: navItems[3].key,
                            child: ProjectsSection(),
                          ),
                        ],
                      ),
                    ],
                  ), */
                  SizedBox(height: spacerHeight),
                  const Stack(
                    children: [
                      /* Positioned(
                        left: -assignWidth(context, 0.6),
                        child: Image.asset(ImagePath.BLOB_ASH),
                      ), */
                      Column(
                        children: [
                          /* Container(
                            key: navItems[4].key,
                            child: AwardsSection(),
                          ),
                          SpaceH40(),
                          Container(
                            key: navItems[5].key,
                            child: BlogSection(),
                          ), */
                          FooterSection(),
                        ],
                      )
                    ],
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
