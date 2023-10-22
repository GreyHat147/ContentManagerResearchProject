import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:research_project/repository/models/publication.dart';

class PublicationsRepository {
  final FirebaseFirestore _firestore;
  PublicationsRepository(FirebaseFirestore firestore) : _firestore = firestore;

  Future<List<Publication>> getPublications() {
    return _firestore.collection('publications').get().then(
      (snapshot) {
        return snapshot.docs.map(
          (doc) {
            return Publication.fromJson(doc.data());
          },
        ).toList();
      },
    );
  }
}
