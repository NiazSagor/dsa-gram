class PatternModel {
  final String id;
  final String title;
  final String category;
  final String? description;
  final int orderIndex;
  final DateTime createdAt;

  PatternModel({
    required this.id,
    required this.title,
    required this.category,
    this.description,
    required this.orderIndex,
    required this.createdAt,
  });

  factory PatternModel.fromJson(Map<String, dynamic> json) {
    return PatternModel(
      id: json['id'] as String,
      title: json['title'] as String,
      category: json['category'] as String,
      description: json['description'] as String?,
      orderIndex: json['order_index'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'description': description,
      'order_index': orderIndex,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
