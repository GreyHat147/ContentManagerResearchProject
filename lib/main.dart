import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:research_project/config/app_theme.dart';
import 'package:research_project/presentation/pages/home_page.dart';

void main() {
  runApp(const ResearchProject());
}

class ResearchProject extends StatelessWidget {
  const ResearchProject({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: MaterialApp(
        title: 'Proyecto de investigación',
        theme: AppTheme.lightThemeData,
        home: HomePage(),
      ),
    );
  }

  //TODO: Implement router
  /*  @override
  Widget build(BuildContext context) {
    return Layout(
      child: MaterialApp.router(
        title: 'Proyecto de investigación',
        theme: AppTheme.lightThemeData,
        debugShowCheckedModeBanner: false,
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
      ),
    );
  } */
}
