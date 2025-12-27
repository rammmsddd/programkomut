import 'command.dart';

class Program {
  final String id;
  final String name;
  final String imageUrl;
  final List<Command> commands;

  Program({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.commands,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'imageUrl': imageUrl,
    'commands': commands.map((c) => c.toJson()).toList(),
  };

  factory Program.fromJson(Map<String, dynamic> json) => Program(
    id: json['id'],
    name: json['name'],
    imageUrl: json['imageUrl'],
    commands: (json['commands'] as List)
        .map((c) => Command.fromJson(c))
        .toList(),
  );
}
