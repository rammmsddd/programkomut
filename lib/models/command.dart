class Command {
  final String id;
  final String name;
  final String shortcut;
  final String description;
  final String breadcrumb;

  Command({
    required this.id,
    required this.name,
    required this.shortcut,
    required this.description,
    required this.breadcrumb,
  });

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
