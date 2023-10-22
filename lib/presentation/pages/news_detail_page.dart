import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:intl/intl.dart';
import 'package:research_project/config/values/values.dart';
import 'package:research_project/presentation/widgets/buttons/nimbus_button.dart';
import 'package:research_project/presentation/widgets/nimbus_info_section.dart';
import 'package:research_project/repository/models/news.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:research_project/presentation/layout/adaptative.dart';
import 'package:research_project/presentation/pages/layout_template.dart';
import 'package:research_project/presentation/widgets/spaces.dart';

const double kSpacing = 28.0;
const double kRunSpacing = 16.0;

class NewsDetailArguments {
  final News newSelected;

  NewsDetailArguments({required this.newSelected});
}

class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage({super.key});

  Widget _noNewAvaiable() {
    return const Center(
      child: Text("No se encontro una noticia disponible"),
    );
  }

  void _goToNews(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;

    TextTheme textTheme = Theme.of(context).textTheme;
    double fontSize = responsiveSize(context, 16, 18);
    EdgeInsetsGeometry padding =
        EdgeInsets.symmetric(horizontal: getSidePadding(context));
    double screenWidth = widthOfScreen(context) - (getSidePadding(context) * 2);

    return LayoutTemplate(
      child: Container(
        padding: EdgeInsets.all(
          getSidePadding(context),
        ),
        child: Padding(
          padding: padding,
          child: ResponsiveBuilder(
            builder: (context, sizingInformation) {
              if (args == null) return _noNewAvaiable();
              NewsDetailArguments arguments = args as NewsDetailArguments;
              final News newSelected = arguments.newSelected;
              double widthOfScreen = sizingInformation.screenSize.width;
              if (widthOfScreen < (const RefinedBreakpoints().tabletLarge)) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NimbusButton(
                      buttonTitle: "Regresar a noticias",
                      buttonColor: AppColors.primaryColor,
                      onPressed: () => _goToNews(context),
                    ),
                    const SpaceH60(),
                    NimbusInfoSection1(
                      sectionTitle: newSelected.category,
                      title1: newSelected.name,
                      title2: DateFormat.yMMMEd()
                          .format(DateTime.parse(newSelected.date)),
                      title2Style: TextStyle(
                        color: Colors.grey,
                        fontSize: fontSize,
                      ),
                      body: newSelected.description,
                      child: HtmlWidget(newSelected.content),
                    ),
                  ],
                );
              } else if (widthOfScreen >=
                      const RefinedBreakpoints().tabletLarge &&
                  widthOfScreen <= 1024) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NimbusButton(
                      buttonTitle: "Regresar a noticias",
                      buttonColor: AppColors.primaryColor,
                      onPressed: () => _goToNews(context),
                    ),
                    const SpaceH60(),
                    NimbusInfoSection1(
                      sectionTitle: newSelected.category,
                      title1: newSelected.name,
                      title2: DateFormat.yMMMEd()
                          .format(DateTime.parse(newSelected.date)),
                      title2Style: TextStyle(
                        color: Colors.grey,
                        fontSize: fontSize,
                      ),
                      body: newSelected.description,
                      child: HtmlWidget(newSelected.content),
                    ),
                    const SpaceH30(),
                  ],
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NimbusButton(
                      buttonTitle: "Regresar a noticias",
                      buttonColor: AppColors.primaryColor,
                      onPressed: () => _goToNews(context),
                    ),
                    const SpaceH60(),
                    NimbusInfoSection1(
                      sectionTitle: newSelected.category,
                      title1: newSelected.name,
                      title2: DateFormat.yMMMEd()
                          .format(DateTime.parse(newSelected.date)),
                      title2Style: TextStyle(
                        color: Colors.grey,
                        fontSize: fontSize,
                      ),
                      body: newSelected.description,
                      newImage: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(Sizes.radius10),
                        ),
                        child: Image.network(
                          newSelected.image,
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: HtmlWidget(newSelected.content),
                    ),
                    const SpaceH30(),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
