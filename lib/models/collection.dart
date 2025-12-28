class Collection {
  final String id;
  final String name;
  final List<String> commandIds;
  final DateTime createdAt;

  Collection({
    required this.id,
    required this.name,
    required this.commandIds,
    required this.createdAt,
  });

  // JSON serialization for storage and sharing
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'commandIds': commandIds,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory Collection.fromJson(Map<String, dynamic> json) {
    return Collection(
      id: json['id'] as String,
      name: json['name'] as String,
      commandIds: List<String>.from(json['commandIds'] as List),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  // Create a copy with modified fields
  Collection copyWith({
    String? id,
    String? name,
    List<String>? commandIds,
    DateTime? createdAt,
  }) {
    return Collection(
      id: id ?? this.id,
      name: name ?? this.name,
      commandIds: commandIds ?? this.commandIds,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
