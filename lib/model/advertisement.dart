class Ads {
  String? id;
  String? title;
  String? content;
  DateTime? time;

  Ads({this.id, this.title, this.content, this.time});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'time': time,
    };
  }

  factory Ads.fromMap(String id, Map<String, dynamic> map) {
    return Ads(
      id: id,
      title: map['title'],
      content: map['content'],
      time: map['time']?.toDate(),
    );
  }
}
