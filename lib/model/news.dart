class News {
  String? id;
  String? title;
  String? content;
  String? imageUrl;
  DateTime? time;

  News({this.id, this.title, this.content, this.imageUrl, this.time});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'imageUrl': imageUrl,
      'time': time,
    };
  }

  factory News.fromMap(String id, Map<String, dynamic> map) {
    return News(
      id: id,
      title: map['title'],
      content: map['content'],
      imageUrl: map['imageUrl'],
      time: map['time']?.toDate(),
    );
  }
}
