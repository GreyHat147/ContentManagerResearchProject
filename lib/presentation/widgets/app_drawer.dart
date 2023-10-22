import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:auto_route/auto_route.dart';
import 'package:research_project/config/values/values.dart';
import 'package:research_project/presentation/layout/adaptative.dart';
import 'package:research_project/presentation/widgets/spaces.dart';

import 'nav_item.dart';

const kSpacing20 = Sizes.size20;

class AppDrawer extends StatefulWidget {
  final Color color;
  final double? width;
  final List<NavItemData> menuList;
  final GestureTapCallback? onClose;

  const AppDrawer({
    super.key,
    this.color = AppColors.black200,
    this.width,
    required this.menuList,
    this.onClose,
  });

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    double defaultWidthOfDrawer = responsiveSize(
      context,
      assignWidth(context, 0.85),
      assignWidth(context, 0.60),
      md: assignWidth(context, 0.60),
    );
    return SizedBox(
      width: widget.width ?? defaultWidthOfDrawer,
      child: Drawer(
        child: Container(
          color: widget.color,
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.padding24,
            vertical: Sizes.padding24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  /*  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      ImagePath.LOGO_LIGHT,
                      height: Sizes.HEIGHT_52,
                    ),
                  ), */
                  const Spacer(),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.close,
                      size: Sizes.iconSize30,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
              const Spacer(flex: 2),
              ..._buildMenuList(
                context: context,
                menuList: widget.menuList,
              ),
              const Spacer(flex: 6),
              //_buildFooterText(),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildMenuList({
    required BuildContext context,
    required List<NavItemData> menuList,
  }) {
    TextTheme textTheme = Theme.of(context).textTheme;
    List<Widget> menuItems = [];
    for (var i = 0; i < menuList.length; i++) {
      menuItems.add(
        NavItem(
          onTap: () => _onTapNavItem(
            context: context,
            navItemName: menuList[i].name,
          ),
          title: menuList[i].name,
          isMobile: true,
          isSelected: menuList[i].isSelected,
          titleStyle: textTheme.bodyLarge?.copyWith(
            color:
                menuList[i].isSelected ? AppColors.primary200 : AppColors.white,
            fontSize: Sizes.textSize16,
            fontWeight:
                menuList[i].isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      );
      menuItems.add(const Spacer());
    }
    return menuItems;
  }

  _onTapNavItem({
    required BuildContext context,
    required String navItemName,
  }) {
    for (int index = 0; index < widget.menuList.length; index++) {
      if (navItemName == widget.menuList[index].name) {
        setState(() {
          widget.menuList[index].isSelected = true;
        });
        print("going to ${widget.menuList[index].routeName}");
        Navigator.pushNamed(context, widget.menuList[index].routeName);
      } else {
        widget.menuList[index].isSelected = false;
      }
    }
  }

  Widget _buildFooterText() {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? footerTextStyle = textTheme.bodySmall?.copyWith(
      color: AppColors.primaryText2,
      fontWeight: FontWeight.bold,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: SelectableText.rich(
            TextSpan(
              text: "© 2023",
              style: footerTextStyle,
              children: [
                const TextSpan(text: "BY CARLOS"),
                TextSpan(
                  text: "CARLOS.COM",
                  style: footerTextStyle?.copyWith(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w900,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
