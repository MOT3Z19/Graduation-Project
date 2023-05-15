import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled8/model/advertisement.dart';

import '../model/news.dart';

class AdsController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final RxList<Ads> adsList = <Ads>[].obs;

  Stream<List<Ads>> get adsStream => firestore
      .collection('Ads')
      .orderBy('time', descending: true)
      .snapshots()
      .map((querySnapshot) => querySnapshot.docs
      .map((doc) => Ads.fromMap(doc.id, doc.data()))
      .toList());

  Future<void> addAds(String title, String content) async {
    try {
      await firestore.collection('Ads').add({
        'title': title,
        'content': content,
        'time': DateTime.now(),
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateAds(
      String id, String title, String content) async {
    try {
      await firestore.collection('Ads').doc(id).update({
        'title': title,
        'content': content,
        'time': DateTime.now(),
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteAds(String id) async {
    try {
      await firestore.collection('Ads').doc(id).delete();
    } catch (e) {
      print(e);
    }
  }
}
