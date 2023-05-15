import 'package:cloud_firestore/cloud_firestore.dart';

class NewsItem {
  final String? id;
  final String? title;
  final String? description;
  final String? imageUrl;
  final Timestamp? date;

  NewsItem({
    this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.date,
  });

  factory NewsItem.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    final id = doc.id;
    final title = data['title'] as String?;
    final description = data['description'] as String?;
    final imageUrl = data['imageUrl'] as String?;
    final date = data['date'] as Timestamp?;

    return NewsItem(
      id: id,
      title: title,
      description: description,
      imageUrl: imageUrl,
      date: date,
    );
  }

  Map<String, dynamic> toFirestore() => {
    'title': title,
    'description': description,
    'imageUrl': imageUrl,
    'date': date,
  };
}
