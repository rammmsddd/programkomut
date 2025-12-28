import 'package:flutter/material.dart';
import '../../models/program.dart';
import '../../models/command.dart';

// AutoCAD commands are already in the main file, extract separately if needed
final Program autocadProgram = Program(
  id: 'autocad',
  name: 'AutoCAD',
  brandColor: const Color(0xFFE51937),
  commands: [], // Will be populated from existing data
);
