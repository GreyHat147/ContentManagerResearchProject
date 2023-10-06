import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:research_project/presentation/services/navigation_service.dart';
import 'package:research_project/repository/publications_repository.dart';
import 'package:research_project/view_model/publication_view_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton<FirebaseFirestore>(
    () => FirebaseFirestore.instance,
  );

  locator.registerLazySingleton<PublicationsRepository>(
    () => PublicationsRepository(locator()),
  );

  locator.registerLazySingleton<PublicationViewModel>(
    () => PublicationViewModel(locator()),
  );
}
