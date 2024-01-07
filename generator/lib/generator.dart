import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:dart_style/dart_style.dart';
import 'package:generator/tura_container_formatter.dart';
import 'package:generator/tura_dependable.dart';
import 'package:source_gen/source_gen.dart';
import 'package:generator/annotation.dart';

final Set<TuraDependable> depenables = {};

class FactoryGenerator extends GeneratorForAnnotation<TuraFactory> {
  @override
  generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async {
    if (element is ClassElement) {
      final bool isSingletone =
          annotation.objectValue.getField('singletone')?.toBoolValue() ?? false;
      final bool isEagerSingletone =
          annotation.objectValue.getField('eagerSingletone')?.toBoolValue() ??
              false;
      final DartType? cast =
          annotation.objectValue.getField('cast')?.toTypeValue();

      depenables.add(TuraDependable(
          classElement: element,
          singletone: isSingletone,
          isEagerSingletone: isEagerSingletone,
          cast: cast?.element?.name));
    }
  }
}

class InitializerGenerator extends GeneratorForAnnotation<TuraContainer> {
  @override
  generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async {
    final StringBuffer result = StringBuffer();
    final containerFomatter = TuraContainerFormatter(depenables: depenables);

    final imports = containerFomatter.imports.join('\n');

    result.writeln(imports);

    result.writeln(containerFomatter.header);
    result.write('\n\n ///\n');
    result.writeAll(containerFomatter.fields, '\n');
    result.write('\n\n ///\n');
    result.writeAll(containerFomatter.factories, '\n');
    result.write('\n\n ///\n');
    result.write(containerFomatter.constructor);

    result.writeln(containerFomatter.footer);

    return DartFormatter().format(result.toString());
  }
}
