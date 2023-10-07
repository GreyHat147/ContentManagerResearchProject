import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
    required List<BlogCardData> blogData,
    required double width,
  }) {
    double cardWidth = ((width - (kSpacing * 2)) / 3);
    List<Widget> items = [];

    for (int index = 0; index < blogData.length; index++) {
      items.add(
        NewsCard(
          width: cardWidth,
          imageWidth: cardWidth,
          imageHeight: cardWidth,
          category: blogData[index].category,
          title: blogData[index].title,
          date: blogData[index].date,
          buttonText: blogData[index].buttonText,
          imageUrl: blogData[index].imageUrl,
          onPressed: () {},
        ),
      );
    }
    return items;
  }

  Widget _buildDotsIndicator({
    required int pageLength,
    required int currentIndex,
  }) {
    return DotsIndicator(
      dotsCount: pageLength,
      position: currentIndex,
      onTap: (index) {
        //_moveToNextCarousel(index.toInt());
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

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double fontSize = responsiveSize(context, 16, 18);
    EdgeInsetsGeometry padding =
        EdgeInsets.symmetric(horizontal: getSidePadding(context));
    double screenWidth = widthOfScreen(context) - (getSidePadding(context) * 2);

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
                    return SizedBox(
                      width: widthOfScreen,
                      height: screenWidth + 250,
                      child: CarouselSlider.builder(
                        itemCount: data.length,
                        itemBuilder: (BuildContext context, int index,
                            int pageViewIndex) {
                          return NewsCard(
                            width: screenWidth,
                            imageWidth: screenWidth,
                            imageHeight: screenWidth,
                            category: data[index].category,
                            title: data[index].title,
                            date: data[index].date,
                            buttonText: data[index].buttonText,
                            imageUrl: data[index].imageUrl,
                            onPressed: () {},
                          );
                        },
                        options: carouselOptions(),
                      ),
                    );
                  } else if (widthOfScreen >=
                          const RefinedBreakpoints().tabletLarge &&
                      widthOfScreen <= 1024) {
                    return Column(
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
                                category: data[index].category,
                                title: data[index].title,
                                date: data[index].date,
                                buttonText: data[index].buttonText,
                                imageUrl: data[index].imageUrl,
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
                        _buildDotsIndicator(
                          pageLength: data.length,
                          currentIndex: currentPageIndex,
                        ),
                        const SpaceH100(),
                      ],
                    );
                  } else {
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          Wrap(
                            spacing: kSpacing,
                            runSpacing: kRunSpacing,
                            children: _buildNewsCard(
                              blogData: data,
                              width: screenWidth,
                            ),
                          ),
                          const SpaceH100(),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
