class NewsModel {
  final int id;
  final String title;
  final String description;
  final String symptoms;
  final String cure;
  final String effects;
  final DateTime createdAt;
  final DateTime updatedAt;

  NewsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.symptoms,
    required this.cure,
    required this.effects,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      id: json['id'] as int,
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      symptoms: json['symptoms'] as String? ?? '',
      cure: json['cure'] as String? ?? '',
      effects: json['effects'] as String? ?? '',
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }
}
