import 'package:flutter/material.dart';
import 'command.dart';

class Program {
  final String id;
  final String name;
  final String? imageUrl; // Optional - no longer required
  final Color brandColor; // Brand color for the program
  final List<Command> commands;

  Program({
    required this.id,
    required this.name,
    this.imageUrl, // Optional
    required this.brandColor,
    required this.commands,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'imageUrl': imageUrl,
    'brandColor': brandColor.toARGB32(),
    'commands': commands.map((c) => c.toJson()).toList(),
  };

  factory Program.fromJson(Map<String, dynamic> json) => Program(
    id: json['id'],
    name: json['name'],
    imageUrl: json['imageUrl'],
    brandColor: Color(json['brandColor'] ?? 0xFF6366F1),
    commands: (json['commands'] as List)
        .map((c) => Command.fromJson(c))
        .toList(),
  );
}
