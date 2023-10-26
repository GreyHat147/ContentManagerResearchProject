import 'package:flutter/material.dart';
import 'package:research_project/config/values/values.dart';
import 'package:research_project/presentation/layout/adaptative.dart';
import 'package:research_project/presentation/pages/layout_template.dart';
import 'package:research_project/presentation/widgets/member_card.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

class TeamPage extends StatelessWidget {
  const TeamPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = widthOfScreen(context) - (getSidePadding(context) * 2);
    return LayoutTemplate(
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          double widthOfScreen = sizingInformation.screenSize.width;
          EdgeInsets padding = const EdgeInsets.all(80);
          int minItemsPerRow = 4;
          double minItemWidth = 400;
          double cardHeight = minItemWidth;
          if (widthOfScreen < (const RefinedBreakpoints().tabletLarge)) {
            minItemsPerRow = 1;
            minItemWidth = screenWidth;
            cardHeight = screenWidth;
            padding = const EdgeInsets.all(10);
          } else if (widthOfScreen >= const RefinedBreakpoints().tabletLarge &&
              widthOfScreen <= 1024) {
            minItemsPerRow = 2;
            minItemWidth = 250;
          }

          return Padding(
            padding: padding,
            child: ResponsiveGridList(
              horizontalGridSpacing: 80, // Horizontal space between grid items
              verticalGridSpacing: 80, // Vertical space between grid items
              horizontalGridMargin: 30, // Horizontal space around the grid
              verticalGridMargin: 30, // Vertical space around the grid
              minItemWidth:
                  minItemWidth, // The minimum item width (can be smaller, if the layout constraints are smaller)
              minItemsPerRow: minItemsPerRow,
              maxItemsPerRow: 4,
              listViewBuilderOptions: ListViewBuilderOptions(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
              ), // Options that are getting passed to the ListView.builder() function
              children: Data.membersCardData.map((item) {
                return MemberCard(
                  title: item.title,
                  description: item.description,
                  imagePath: item.imagePath,
                  width: minItemWidth,
                  height: cardHeight,
                  institution: item.institution,
                );
              }).toList(), // The list of widgets in the list
            ),
          );
        },
      ),
    );
  }
}
