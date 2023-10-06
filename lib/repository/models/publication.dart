class Publication {
  final String citation;
  final String link;
  final String id;

  const Publication({
    required this.citation,
    required this.link,
    required this.id,
  });

  factory Publication.fromJson(Map<String, dynamic> json) {
    return Publication(
      id: json["id"],
      citation: json["citation"],
      link: json["link"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "citation": citation,
      "link": link,
    };
  }
}
