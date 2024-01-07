import 'package:analyzer/dart/element/element.dart';
import 'package:collection/collection.dart';

class TuraDependable {
  final ClassElement classElement;
  final bool singletone;
  final String? cast;
  final bool isEagerSingletone;

  TuraDependable(
      {required this.classElement,
      required this.singletone,
      required this.cast,
      required this.isEagerSingletone});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TuraDependable && other.classElement == classElement;
  }

  @override
  int get hashCode => classElement.hashCode;

  @override
  String toString() =>
      'TuraDependable(classElement: $classElement, singletone: $singletone, cast: $cast, deps: $depedencies, imports: $imports)\n';

  List<ParameterElement> get depedencies =>
      (classElement.unnamedConstructor?.parameters.map((e) => e).toList() ?? [])
        ..sort(
          (a, b) => !a.isNamed ? -1 : 0,
        );

  Iterable<String> get imports {
    return depedencies
        .map((e) => e.type.element?.librarySource?.uri.toString())
        .whereNotNull();
  }
}
