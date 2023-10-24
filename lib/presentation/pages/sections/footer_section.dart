import 'package:flutter/material.dart';
import 'package:research_project/config/values/values.dart';
import 'package:research_project/presentation/layout/adaptative.dart';
import 'package:research_project/presentation/widgets/content_area.dart';
import 'package:research_project/presentation/widgets/spaces.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

List<PartnerWidget> partnerItems = [
  const PartnerWidget(
    imagePath: ImagePath.partner1,
    urlWbsite: "https://www.konradlorenz.edu.co/",
  ),
];

List<PartnerWidget> backedPartnersItems = [
  const PartnerWidget(
    imagePath: ImagePath.partner2,
    urlWbsite: "https://minciencias.gov.co/",
  ),
  const PartnerWidget(
    imagePath: ImagePath.partner3,
    urlWbsite: "https://crcom.gov.co/es/",
  ),
];

class FooterSection extends StatefulWidget {
  const FooterSection({super.key});

  @override
  State<FooterSection> createState() => _FooterSectionState();
}

class _FooterSectionState extends State<FooterSection> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? footerTextStyle = textTheme.bodySmall?.copyWith(
      color: AppColors.primaryText2,
      fontWeight: FontWeight.bold,
    );
    double screenWidth = widthOfScreen(context) - (getSidePadding(context) * 2);
    double screenHeight = heightOfScreen(context);
    double contentAreaWidth = screenWidth;
    double contentAreaHeight = responsiveSize(
      context,
      screenHeight,
      screenHeight * 0.7,
      md: screenHeight * 0.85,
      sm: screenHeight * 0.85,
    );

    return ContentArea(
      padding: EdgeInsets.symmetric(horizontal: getSidePadding(context)),
      child: Column(
        children: [
          ResponsiveBuilder(
            builder: (context, sizingInformation) {
              double screenWidth = sizingInformation.screenSize.width;

              if (screenWidth <= (const RefinedBreakpoints().tabletNormal)) {
                return _buildFooterSectionSm(
                  width: contentAreaWidth,
                  height: contentAreaHeight,
                );
              } else {
                return _buildFooterSectionLg(
                  width: contentAreaWidth,
                  height: contentAreaHeight,
                );
              }
            },
          ),
          const SpaceH20(),
        ],
      ),
    );
  }

  List<Widget> _buildPartnersItems(
    List<PartnerWidget> data, {
    bool isHorizontal = false,
  }) {
    List<Widget> items = [];

    for (int index = 0; index < data.length; index++) {
      items.add(
        Expanded(
          child: PartnerWidget(
            imagePath: data[index].imagePath,
            urlWbsite: data[index].urlWbsite,
          ),
        ),
      );
      if (index < data.length - 1) {
        if (isHorizontal) {
          items.add(const Spacer(flex: 2));
        } else {
          items.add(const SpaceH40());
        }
      }
    }
    return items;
  }

  Widget _buildFooterSectionSm({
    required double width,
    required double height,
  }) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return ContentArea(
      width: width,
      backgroundColor: AppColors.black400,
      borderRadius: const BorderRadius.all(
        Radius.circular(Sizes.radius8),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(Sizes.radius8),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -(height * 0.1),
              left: -(height * 0.15),
              child: Image.asset(
                ImagePath.boxCoverGold,
                // width: width * 0.6 ,
                height: height * 0.5,
                // fit: BoxFit.fill,
              ),
            ),
            Positioned(
              bottom: -(height * 0.1),
              right: -(height * 0.1),
              child: Image.asset(
                ImagePath.boxCoverBlack,
                height: height * 0.6,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SpaceH80(),
                  Text(
                    "Proyecto ejecutado por:",
                    textAlign: TextAlign.center,
                    style: textTheme.displaySmall
                        ?.copyWith(color: AppColors.white, fontSize: 20),
                  ),
                  const SpaceH60(),
                  const PartnerWidget(
                    imagePath: ImagePath.partner1,
                    urlWbsite: "https://www.konradlorenz.edu.co/",
                  ),
                  const SpaceW40(),
                  const PartnerWidget(
                    imagePath: ImagePath.partner4,
                    urlWbsite: "https://universidadean.edu.co/",
                  ),
                  const SpaceH80(),
                  Text(
                    "Proyecto Co-financiado por:",
                    textAlign: TextAlign.center,
                    style: textTheme.displaySmall
                        ?.copyWith(color: AppColors.white, fontSize: 20),
                  ),
                  const SpaceH60(),
                  const PartnerWidget(
                    imagePath: ImagePath.partner2,
                    urlWbsite: "https://minciencias.gov.co/",
                  ),
                  const SpaceW40(),
                  const PartnerWidget(
                    imagePath: ImagePath.partner3,
                    urlWbsite: "https://crcom.gov.co/es/",
                  ),
                  const SpaceH80(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooterSectionLg({
    required double width,
    required double height,
  }) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return ContentArea(
      width: width,
      height: height,
      backgroundColor: AppColors.black400,
      borderRadius: const BorderRadius.all(
        Radius.circular(Sizes.radius8),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(Sizes.radius8),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -(height * 0.15),
              left: -(height * 0.15),
              child: Image.asset(
                ImagePath.boxCoverGold,
                // width: width ,
                height: height * 0.5,
                // fit: BoxFit.fill,
              ),
            ),
            Positioned(
              top: -(height * 0.15),
              right: -(height * 0.1),
              // bottom: -25,
              child: Image.asset(
                ImagePath.boxCoverBlack,
                height: height * 1.25,
                fit: BoxFit.cover,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const SpaceH80(),
                    Text(
                      "Proyecto ejecutado por:",
                      textAlign: TextAlign.center,
                      style: textTheme.displaySmall
                          ?.copyWith(color: AppColors.white, fontSize: 20),
                    ),
                    const SpaceH60(),
                    const Row(
                      children: [
                        PartnerWidget(
                          imagePath: ImagePath.partner1,
                          urlWbsite: "https://www.konradlorenz.edu.co/",
                        ),
                        SpaceW40(),
                        PartnerWidget(
                          imagePath: ImagePath.partner4,
                          urlWbsite: "https://universidadean.edu.co/",
                        ),
                      ],
                    ),
                    const SpaceH80(),
                  ],
                ),
                Column(
                  children: [
                    const SpaceH80(),
                    Text(
                      "Proyecto Co-financiado por:",
                      textAlign: TextAlign.center,
                      style: textTheme.displaySmall
                          ?.copyWith(color: AppColors.white, fontSize: 20),
                    ),
                    const SpaceH60(),
                    const Row(
                      children: [
                        PartnerWidget(
                          imagePath: ImagePath.partner2,
                          urlWbsite: "https://minciencias.gov.co/",
                        ),
                        SpaceW40(),
                        PartnerWidget(
                          imagePath: ImagePath.partner3,
                          urlWbsite: "https://crcom.gov.co/es/",
                        ),
                      ],
                    ),
                    const SpaceH80(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PartnerWidget extends StatelessWidget {
  final String imagePath;
  final String urlWbsite;
  const PartnerWidget({
    super.key,
    required this.imagePath,
    required this.urlWbsite,
  });

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
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: Sizes.margin8),
      child: InkWell(
        onTap: () => _launchUrl(urlWbsite),
        child: Image.asset(
          imagePath,
          width: Sizes.width180,
          height: Sizes.height180,
        ),
      ),
    );
  }
}

class FooterItem extends StatelessWidget {
  const FooterItem({
    super.key,
    required this.iconData,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Icon(
          iconData,
          color: AppColors.primaryColor,
          size: Sizes.iconSize36,
        ),
        const SpaceH8(),
        Text(
          title,
          style: textTheme.titleMedium?.copyWith(
            color: AppColors.white,
          ),
        ),
        const SpaceH8(),
        Text(
          subtitle,
          style: textTheme.bodyLarge?.copyWith(
            color: AppColors.grey250,
          ),
        ),
      ],
    );
  }
}
