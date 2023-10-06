import 'package:flutter/foundation.dart';
import 'package:research_project/repository/models/publication.dart';
import 'package:research_project/repository/publications_repository.dart';

class PublicationViewModel extends ChangeNotifier {
  final PublicationsRepository _publicationsRepository;
  PublicationViewModel(PublicationsRepository publicationsRepository)
      : _publicationsRepository = publicationsRepository {
    print("PublicationViewModel");
    getPublications();
  }

  List<Publication> publications = [];

  Future<void> getPublications() async {
    print("getPublications");
    publications = await _publicationsRepository.getPublications();
    print(publications);
    notifyListeners();
  }
}
