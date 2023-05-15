import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/news.dart';

class NewsController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final RxList<News> newsList = <News>[].obs;

  Stream<List<News>> get newsStream => firestore
      .collection('news')
      .orderBy('time', descending: true)
      .snapshots()
      .map((querySnapshot) => querySnapshot.docs
      .map((doc) => News.fromMap(doc.id, doc.data()))
      .toList());

  Future<void> addNews(String title, String content, String? imageUrl) async {
    try {
      await firestore.collection('news').add({
        'title': title,
        'content': content,
        'imageUrl': imageUrl,
        'time': DateTime.now(),
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateNews(
      String id, String title, String content, String? imageUrl) async {
    try {
      await firestore.collection('news').doc(id).update({
        'title': title,
        'content': content,
        'imageUrl': imageUrl,
        'time': DateTime.now(),
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteNews(String id) async {
    try {
      await firestore.collection('news').doc(id).delete();
    } catch (e) {
      print(e);
    }
  }
}
