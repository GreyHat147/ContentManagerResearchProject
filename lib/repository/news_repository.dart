import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:research_project/repository/models/news.dart';

class NewsRepository {
  final FirebaseFirestore _firestore;
  NewsRepository(FirebaseFirestore firestore) : _firestore = firestore;

  Future<List<News>> getNews() {
    return _firestore.collection('news').get().then(
      (snapshot) {
        return snapshot.docs.map(
          (doc) {
            return News.fromJson(doc.data());
          },
        ).toList();
      },
    );
  }

  Future<News> getNew(String id) {
    return _firestore.collection('news').doc(id).get().then(
      (doc) {
        return News.fromJson(doc.data()!);
      },
    );
  }
}
