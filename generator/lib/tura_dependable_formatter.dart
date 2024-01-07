import 'package:change_case/change_case.dart';
import 'package:generator/tura_dependable.dart';

class TuraDependableFormatter {
  final TuraDependable d;

  TuraDependableFormatter(this.d);

  Iterable<String> get imports => [
        "import '${d.classElement.librarySource.uri.toString()}';",
        ...d.imports.map((e) => "import '$e';"),
      ];

  String get generateUnnamedConstructorParams {
    var params = List.from(d.classElement.unnamedConstructor?.parameters ?? [])
      ..sort(
        (a, b) => a.isPositional ? -1 : 0,
      );

    return params
        .map((e) => e.isNamed ? '${e.name}:get${e.type}' : 'get${e.type}')
        .join(',')
        .toString();
  }

  String get factoryName => 'get${d.classElement.name}';
  String get factoryLine {
    if (d.singletone) {
      return " ${castName ?? d.classElement.name} get $factoryName => $fieldName??= ${d.classElement.name}($generateUnnamedConstructorParams);";
    } else {
      return " ${castName ?? d.classElement.name} get $factoryName => ${d.classElement.name}($generateUnnamedConstructorParams);";
    }
  }

  String? get castName => d.cast;

  String get className => d.classElement.name;
  String get fieldName => '_' + d.classElement.name.toLowerFirstCase();
  String get constructorFieldName => 'this.$fieldName';

  String get finalContainerField => 'final $className $fieldName;';
  String get nullableContainerField => 'static $className? $fieldName;';
}
