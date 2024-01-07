import 'package:build/build.dart';
import 'package:generator/generator.dart';

import 'package:source_gen/source_gen.dart';

Builder generateFactories(BuilderOptions options) =>
    LibraryBuilder(FactoryGenerator(), generatedExtension: '.fct.dart');
Builder generateInitializer(BuilderOptions options) =>
    LibraryBuilder(InitializerGenerator(), generatedExtension: '.itz.dart');
