import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:research_project/config/values/values.dart';
import 'package:research_project/presentation/widgets/member_card.dart';

class TeamPage extends StatelessWidget {
  const TeamPage({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(Sizes.padding80),
        child: AlignedGridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: Data.membersCardData.length,
          crossAxisCount: 4,
          mainAxisSpacing: 50,
          crossAxisSpacing: 50,
          itemBuilder: (context, index) {
            return MemberCard(
              title: Data.membersCardData[index].title,
              description: Data.membersCardData[index].description,
              imagePath: Data.membersCardData[index].imagePath,
              width: 300,
              height: 350,
            );
          },
        ),
      );
}
