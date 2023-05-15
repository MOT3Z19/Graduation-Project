class Complaint {
  String title;
  String description;
  String type;
  String imageUrl;

  Complaint({required this.title, required this.description, required this.type, required this.imageUrl});

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'type': type,
      'imageUrl': imageUrl,
    };
  }
}
