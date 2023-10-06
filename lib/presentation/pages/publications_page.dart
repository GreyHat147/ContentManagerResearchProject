import 'package:flutter/material.dart';
import 'package:research_project/config/values/values.dart';
import 'package:research_project/presentation/layout/adaptative.dart';
import 'package:research_project/presentation/pages/layout_template.dart';
import 'package:research_project/presentation/widgets/bullet_text.dart';
import 'package:research_project/presentation/widgets/spaces.dart';
import 'package:url_launcher/url_launcher.dart';

class PublicationsPage extends StatelessWidget {
  const PublicationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double fontSize = responsiveSize(context, 16, 18);

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
                  PublicationWidget(
                      citation: "Esta es la citacion",
                      link: "https://www.google.com"),
                ],
              ),
            ),
          )
        ],
      ),
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
          "\u2022  DERECHOS RESERVADOS",
          style: footerTextStyle,
          textAlign: TextAlign.justify,
        ),
        const SpaceH2(),
        TextButton(
          onPressed: () => _launchUrl(link),
          child: Text(link),
        ),
      ],
    );
  }
}
