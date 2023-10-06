import 'package:flutter/material.dart';
import 'package:research_project/repository/models/publication.dart';
import 'package:research_project/repository/publications_repository.dart';

class PublicationViewModel extends ChangeNotifier {
  final PublicationsRepository _publicationsRepository;
  PublicationViewModel(PublicationsRepository publicationsRepository)
      : _publicationsRepository = publicationsRepository;

  List<Publication> publications = [];

  Future<void> getPublications() async {
    publications = await _publicationsRepository.getPublications();
    notifyListeners();
  }
}
