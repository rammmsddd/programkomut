class Command {
  final String id;
  final String name;
  final String shortcut;
  final String description;
  final String breadcrumb;
  final Map<String, String>? descriptionMap; // i18n support for 15 languages

  Command({
    required this.id,
    required this.name,
    required this.shortcut,
    required this.description,
    required this.breadcrumb,
    this.descriptionMap,
  });

  /// Gets localized description based on language code
  /// Fallback chain: requested locale → 'en' → description (Turkish)
  String getDescription(String locale) {
    if (descriptionMap != null) {
      return descriptionMap![locale] ?? descriptionMap!['en'] ?? description;
    }
    return description;
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'shortcut': shortcut,
    'description': description,
    'breadcrumb': breadcrumb,
  };

  factory Command.fromJson(Map<String, dynamic> json) => Command(
    id: json['id'],
    name: json['name'],
    shortcut: json['shortcut'],
    description: json['description'],
    breadcrumb: json['breadcrumb'],
  );
}
