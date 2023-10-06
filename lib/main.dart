import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:provider/provider.dart';
import 'package:research_project/config/app_theme.dart';
import 'package:research_project/locator.dart';
import 'package:research_project/presentation/pages/layout_template.dart';
import 'package:research_project/presentation/routing/router.dart';
import 'package:research_project/presentation/services/navigation_service.dart';
import 'package:research_project/presentation/routing/routes_names.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:research_project/view_model/publication_view_model.dart';
import 'firebase_options.dart';

void main() async {
  setupLocator();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ResearchProject());
}

class ResearchProject extends StatelessWidget {
  const ResearchProject({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => locator<PublicationViewModel>(),
          ),
        ],
        child: Layout(
          child: MaterialApp(
            builder: (context, child) => child!,
            title: 'Proyecto de investigación',
            theme: AppTheme.lightThemeData,
            initialRoute: homeRoute,
            navigatorKey: locator<NavigationService>().navigatorKey,
            onGenerateRoute: generateRoute,
          ),
        ),
      );
}
