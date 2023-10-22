import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:research_project/presentation/pages/news_detail_page.dart';
import 'package:research_project/repository/models/news.dart';
import 'package:research_project/view_model/news_view_model.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:research_project/config/values/values.dart';
import 'package:research_project/presentation/layout/adaptative.dart';
import 'package:research_project/presentation/pages/layout_template.dart';
import 'package:research_project/presentation/widgets/news_card.dart';
import 'package:research_project/presentation/widgets/spaces.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

const double kSpacing = 28.0;
const double kRunSpacing = 16.0;

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  int currentPageIndex = 1;
  final CarouselController _carouselController = CarouselController();

  final List<BlogCardData> data = [
    BlogCardData(
      category: "Evento",
      title: "Titulo",
      date: "fecha",
      buttonText: "Ver más",
      imageUrl:
          "https://i.scdn.co/image/ab67616d0000b273bcfbbdf59b85f02917890551",
    ),
  ];

  CarouselOptions carouselOptions({
    bool autoPlay = true,
    bool enlargeCenterPage = false,
    bool enableInfiniteScroll = true,
    double viewportFraction = 1.0,
    double aspectRatio = 0.1,
    int initialPage = 1,
    ScrollPhysics? scrollPhysics = const NeverScrollableScrollPhysics(),
  }) {
    return CarouselOptions(
        autoPlay: autoPlay,
        enableInfiniteScroll: enableInfiniteScroll,
        enlargeCenterPage: enlargeCenterPage,
        viewportFraction: viewportFraction,
        aspectRatio: aspectRatio,
        initialPage: initialPage,
        scrollPhysics: scrollPhysics,
        onPageChanged: (int index, CarouselPageChangedReason reason) {
          setState(() {
            currentPageIndex = index;
          });
        });
  }

  List<Widget> _buildNewsCard({
    required List<News> newData,
    required double width,
  }) {
    double cardWidth = ((width - (kSpacing * 2)) / 3);
    List<Widget> items = [];

    for (int index = 0; index < newData.length; index++) {
      items.add(
        NewsCard(
          width: cardWidth,
          imageWidth: cardWidth,
          imageHeight: cardWidth,
          category: newData[index].category,
          title: newData[index].name,
          date: newData[index].date,
          buttonText: "Ver más",
          imageUrl: newData[index].image,
          onPressed: () => _goToNewDetails(newData[index]),
        ),
      );
    }
    return items;
  }

  _moveToNextCarousel(int index) {
    setState(() {
      currentPageIndex = index;
      _carouselController.animateToPage(index);
    });
  }

  Widget _buildDotsIndicator({
    required int pageLength,
    required int currentIndex,
  }) {
    return DotsIndicator(
      dotsCount: pageLength,
      position: currentIndex,
      onTap: (index) {
        _moveToNextCarousel(index.toInt());
      },
      decorator: const DotsDecorator(
        color: AppColors.yellow10,
        activeColor: AppColors.yellow400,
        size: Size(Sizes.size6, Sizes.size6),
        activeSize: Size(Sizes.size24, Sizes.size6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(Sizes.radius8),
          ),
        ),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(Sizes.radius8),
          ),
        ),
        spacing: EdgeInsets.symmetric(horizontal: Sizes.size4),
      ),
    );
  }

  Widget _noNewsAvaiable() {
    return const Center(
      child: Text("No hay noticias disponibles"),
    );
  }

  void _goToNewDetails(News newSelected) {
    Navigator.pushNamed(
      context,
      "/newdetails",
      arguments: NewsDetailArguments(newSelected: newSelected),
    );
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double fontSize = responsiveSize(context, 16, 18);
    EdgeInsetsGeometry padding =
        EdgeInsets.symmetric(horizontal: getSidePadding(context));
    double screenWidth = widthOfScreen(context) - (getSidePadding(context) * 2);

    return Consumer<NewsViewModel>(
      builder: (context, NewsViewModel viewModel, child) {
        return LayoutTemplate(
          child: Container(
            padding: EdgeInsets.all(
              getSidePadding(context),
            ),
            child: Padding(
              padding: padding,
              child: ResponsiveBuilder(
                builder: (context, sizingInformation) {
                  double widthOfScreen = sizingInformation.screenSize.width;
                  int minItemsPerRow = 3;
                  double minItemWidth = 300;
                  double cardHeight = minItemWidth;
                  if (widthOfScreen <
                      (const RefinedBreakpoints().tabletLarge)) {
                    minItemsPerRow = 1;
                    minItemWidth = screenWidth;
                    cardHeight = screenWidth * 0.6;
                  } else if (widthOfScreen >=
                          const RefinedBreakpoints().tabletLarge &&
                      widthOfScreen <= 1024) {
                    minItemsPerRow = 2;
                    minItemWidth = 250;
                  }

                  return ResponsiveGridList(
                    horizontalGridSpacing:
                        100, // Horizontal space between grid items
                    verticalGridSpacing:
                        100, // Vertical space between grid items
                    horizontalGridMargin:
                        30, // Horizontal space around the grid
                    verticalGridMargin: 30, // Vertical space around the grid
                    minItemWidth:
                        minItemWidth, // The minimum item width (can be smaller, if the layout constraints are smaller)
                    minItemsPerRow: minItemsPerRow,
                    maxItemsPerRow: 3,
                    listViewBuilderOptions: ListViewBuilderOptions(
                        shrinkWrap:
                            true), // Options that are getting passed to the ListView.builder() function
                    children: viewModel.news.map((item) {
                      return NewsCard(
                        width: minItemWidth,
                        imageWidth: minItemWidth,
                        imageHeight: cardHeight,
                        category: item.category,
                        title: item.name,
                        date: item.date,
                        buttonText: "Ver más",
                        imageUrl: item.image,
                        onPressed: () => _goToNewDetails(item),
                      );
                    }).toList(), // The list of widgets in the list
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
