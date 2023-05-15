class Comlaint {
  String id;
  String title;
  String description;
  String type;
  String address;
  String imageUrl;
  String userId;
  String status;
  DateTime? time;


  Comlaint({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.address,
    required this.imageUrl,
    required this.userId,
    required this.status,
    required this.time,
  });
}
