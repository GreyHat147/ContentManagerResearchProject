class News {
  final String id;
  final String name;
  final String description;
  final String image;
  final String content;
  final String date;
  final String category;

  const News({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.content,
    required this.date,
    required this.category,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      image: json["image"],
      content: json["content"],
      date: json["date"],
      category: json["category"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "image": image,
      "content": content,
      "date": date,
      "category": category,
    };
  }
}
