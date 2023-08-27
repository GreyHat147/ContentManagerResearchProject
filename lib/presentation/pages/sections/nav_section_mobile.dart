import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:research_project/config/values/values.dart';
import 'package:research_project/presentation/widgets/spaces.dart';

class NavSectionMobile extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const NavSectionMobile({
    super.key,
    required this.scaffoldKey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.height100,
      decoration: const BoxDecoration(
        color: AppColors.black100,
      ),
      child: Row(
        children: [
          const SpaceW30(),
          IconButton(
            icon: const Icon(
              FeatherIcons.menu,
              color: AppColors.white,
              size: Sizes.iconSize36,
            ),
            onPressed: () {
              if (scaffoldKey.currentState!.isEndDrawerOpen) {
                scaffoldKey.currentState?.openEndDrawer();
              } else {
                scaffoldKey.currentState?.openDrawer();
              }
            },
          ),
          const Spacer(),
          /* InkWell(
            onTap: () {},
            child: Image.asset(
              ImagePath.LOGO_LIGHT,
              height: Sizes.HEIGHT_52,
            ),
          ), */
          const Spacer(),
        ],
      ),
    );
  }
}
