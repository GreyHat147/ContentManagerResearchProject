import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:research_project/presentation/pages/home_page.dart';
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

    case publicationsRoute:
      return _getPageRoute(PublicationsPage(), settings);
    default:
      return _getPageRoute(const HomePage(), settings);
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child: child, routeName: settings.name!);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;
  _FadeRoute({required this.child, required this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
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
