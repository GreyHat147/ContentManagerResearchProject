import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:research_project/repository/models/news.dart';
import 'package:research_project/view_model/news_view_model.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:research_project/config/values/values.dart';
import 'package:research_project/presentation/layout/adaptative.dart';
import 'package:research_project/presentation/pages/layout_template.dart';
import 'package:research_project/presentation/widgets/news_card.dart';
import 'package:research_project/presentation/widgets/spaces.dart';

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
          onPressed: () {},
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
                  if (widthOfScreen <
                      (const RefinedBreakpoints().tabletLarge)) {
                    return viewModel.news.isNotEmpty
                        ? SizedBox(
                            width: widthOfScreen,
                            height: screenWidth + 250,
                            child: CarouselSlider.builder(
                              itemCount: viewModel.news.length,
                              itemBuilder: (BuildContext context, int index,
                                  int pageViewIndex) {
                                return NewsCard(
                                  width: screenWidth,
                                  imageWidth: screenWidth,
                                  imageHeight: screenWidth,
                                  category: viewModel.news[index].category,
                                  title: viewModel.news[index].name,
                                  date: viewModel.news[index].date,
                                  buttonText: "Ver más",
                                  imageUrl: viewModel.news[index].image,
                                  onPressed: () {},
                                );
                              },
                              options: carouselOptions(),
                            ),
                          )
                        : _noNewsAvaiable();
                  } else if (widthOfScreen >=
                          const RefinedBreakpoints().tabletLarge &&
                      widthOfScreen <= 1024) {
                    return viewModel.news.isNotEmpty
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: screenWidth,
                                child: CarouselSlider.builder(
                                  itemCount: data.length,
                                  carouselController: _carouselController,
                                  itemBuilder: (BuildContext context, int index,
                                      int pageViewIndex) {
                                    return NewsCard(
                                      width: screenWidth * 0.45,
                                      imageWidth: screenWidth * 0.45,
                                      imageHeight: screenWidth * 0.45,
                                      category: viewModel.news[index].category,
                                      title: viewModel.news[index].name,
                                      date: viewModel.news[index].date,
                                      buttonText: "Ver más",
                                      imageUrl: viewModel.news[index].image,
                                      onPressed: () {},
                                    );
                                  },
                                  options: carouselOptions(
                                    viewportFraction: 0.50,
                                    autoPlay: false,
                                    initialPage: currentPageIndex.toInt(),
                                    aspectRatio: 2 / 1.4,
                                    enableInfiniteScroll: true,
                                    enlargeCenterPage: false,
                                  ),
                                ),
                              ),
                              /* _buildDotsIndicator(
                                pageLength: data.length,
                                currentIndex: currentPageIndex,
                              ), */
                              const SpaceH100(),
                            ],
                          )
                        : _noNewsAvaiable();
                  } else {
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          viewModel.news.isNotEmpty
                              ? Wrap(
                                  spacing: kSpacing,
                                  runSpacing: kRunSpacing,
                                  children: _buildNewsCard(
                                    newData: viewModel.news,
                                    width: screenWidth,
                                  ),
                                )
                              : _noNewsAvaiable(),
                          const SpaceH100(),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
