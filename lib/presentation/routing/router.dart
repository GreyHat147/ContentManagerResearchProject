import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:research_project/presentation/pages/home_page.dart';
import 'package:research_project/presentation/pages/news_detail_page.dart';
import 'package:research_project/presentation/pages/news_page.dart';
import 'package:research_project/presentation/pages/project_page.dart';
import 'package:research_project/presentation/pages/publications_page.dart';
import 'package:research_project/presentation/pages/team_page.dart';
import 'package:research_project/presentation/routing/routes_names.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeRoute:
      return _getPageRoute(const HomePage(), settings);
    case projectRoute:
      return _getPageRoute(ProjectPage(), settings);
    case teamRoute:
      return _getPageRoute(const TeamPage(), settings);
    case newsRoute:
      return _getPageRoute(const NewsPage(), settings);
    case newDetailsRoute:
      return _getPageRoute(const NewsDetailPage(), settings);
    case publicationsRoute:
      return _getPageRoute(const PublicationsPage(), settings);
    default:
      return _getPageRoute(const HomePage(), settings);
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(
    child: child,
    routeName: settings.name!,
    arguments: settings.arguments,
  );
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;
  final Object? arguments;
  _FadeRoute({
    required this.child,
    required this.routeName,
    this.arguments,
  }) : super(
          settings: RouteSettings(name: routeName, arguments: arguments),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
