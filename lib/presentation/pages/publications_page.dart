import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:research_project/config/values/values.dart';
import 'package:research_project/locator.dart';
import 'package:research_project/presentation/layout/adaptative.dart';
import 'package:research_project/presentation/pages/layout_template.dart';
import 'package:research_project/presentation/widgets/bullet_text.dart';
import 'package:research_project/presentation/widgets/spaces.dart';
import 'package:research_project/repository/models/publication.dart';
import 'package:research_project/view_model/publication_view_model.dart';
import 'package:url_launcher/url_launcher.dart';

class PublicationsPage extends StatelessWidget {
  const PublicationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double fontSize = responsiveSize(context, 16, 18);

    List<Widget> _buildPublications(PublicationViewModel viewModel) {
      List<Publication> items = viewModel.publications;
      List<Widget> widgets = [];
      for (int index = 0; index < items.length; index++) {
        widgets.add(
          PublicationWidget(
            citation: items[index].citation,
            link: items[index].link,
          ),
        );
        widgets.add(const SpaceH30());
      }
      return widgets;
    }

    return Consumer<PublicationViewModel>(
      builder: (context, PublicationViewModel viewModel, _) {
        return LayoutTemplate(
          child: Stack(
            children: [
              Positioned(
                top: assignWidth(context, 0.1),
                left: -assignWidth(context, 0.05),
                child: Image.asset(ImagePath.blobFemurAsh),
              ),
              Positioned(
                right: -assignWidth(context, 0.5),
                child: Image.asset(ImagePath.blobSmallBeanAsh),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: getSidePadding(context),
                  right: getSidePadding(context),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SpaceH100(),
                      Visibility(
                        visible: viewModel.publications.isNotEmpty,
                        child: Column(
                          children: _buildPublications(viewModel),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class PublicationWidget extends StatelessWidget {
  const PublicationWidget({
    Key? key,
    required this.citation,
    required this.link,
  }) : super(key: key);

  final String citation;
  final String link;

  Future<void> _launchUrl(String link) async {
    if (!await launchUrl(
      Uri.parse(link),
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $link');
    }
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    TextStyle? footerTextStyle = textTheme.bodySmall?.copyWith(
      color: AppColors.primaryText2,
      fontWeight: FontWeight.bold,
    );
    return Column(
      children: [
        Text(
          "\u2022  $citation",
          style: footerTextStyle,
          textAlign: TextAlign.justify,
        ),
        const SpaceH2(),
        TextButton(
          onPressed: () => _launchUrl(link),
          child: Text(
            link,
          ),
        ),
      ],
    );
  }
}
