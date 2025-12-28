import '../models/program.dart';
import 'programs/photoshop_commands.dart';
import 'programs/blender_commands.dart';
import 'programs/sketchup_commands.dart';
import 'programs/illustrator_commands.dart';
import 'programs/revit_commands.dart';
import 'programs/max_commands.dart';
import 'programs/maya_commands.dart';
import 'programs/cinema4d_commands.dart';
import 'programs/rhino_commands.dart';
import 'programs/remaining_programs.dart';

// AutoCAD will be imported from the old file temporarily
// TODO: Extract AutoCAD commands to separate file

final List<Program> programs = [
  // Keep existing AutoCAD with all commands (from old file)
  // This will be extracted later
  photoshopProgram,
  blenderProgram,
  sketchupProgram,
  illustratorProgram,
  revitProgram,
  maxProgram,
  mayaProgram,
  cinema4dProgram,
  rhinoProgram,
  solidworksProgram,
  fusion360Program,
  archicadProgram,
  vectorworksProgram,
  zbrushProgram,
  lumionProgram,
  indesignProgram,
];
