class CardModel {
  final String id;
  final String patternId;
  final String type;
  final String? title;
  final String? content;
  final String? htmlContent;
  final String? codeSnippet;
  final Map<String, dynamic>? jsonContent;
  final int orderIndex;
  final DateTime createdAt;

  CardModel({
    required this.id,
    required this.patternId,
    required this.type,
    this.title,
    this.content,
    this.htmlContent,
    this.codeSnippet,
    this.jsonContent,
    required this.orderIndex,
    required this.createdAt,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      id: json['id'] as String,
      patternId: json['pattern_id'] as String,
      type: json['type'] as String,
      title: json['title'] as String?,
      content: json['content'] as String?,
      htmlContent: json['html_content'] as String?,
      codeSnippet: json['code_snippet'] as String?,
      jsonContent: json['json_content'] != null 
          ? Map<String, dynamic>.from(json['json_content'] as Map) 
          : null,
      orderIndex: json['order_index'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pattern_id': patternId,
      'type': type,
      'title': title,
      'content': content,
      'html_content': htmlContent,
      'code_snippet': codeSnippet,
      'json_content': jsonContent,
      'order_index': orderIndex,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
