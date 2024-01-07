import 'package:generator/tura_dependable.dart';
import 'package:generator/tura_dependable_formatter.dart';

class TuraContainerFormatter {
  final Set<TuraDependable> depenables;
  late final List<TuraDependableFormatter> formatters;
  TuraContainerFormatter({
    required this.depenables,
  }) {
    formatters = depenables.map((e) => TuraDependableFormatter(e)).toList();
  }

  Set<String> get imports {
    final Set<String> imports = [
      for (final f in formatters) ...f.imports,
    ].toSet();

    return imports;
  }

  Set<String> get fields {
    return [
      for (final d in formatters)
        if (d.d.singletone) d.nullableContainerField
    ].toSet();
  }

  Set<String> get factories {
    return [for (final d in formatters) d.factoryLine].toSet();
  }

  String get header => 'class TuraContainerBox {';
  String get footer => '}';

  String get constructor {
    final eagerSingletones = formatters.where(
        (element) => element.d.singletone && element.d.isEagerSingletone);
    if (eagerSingletones.isEmpty) {
      return 'TuraContainer();';
    } else {
      String eagerCalls = eagerSingletones.map((e) => e.factoryName).join(";");
      if (!eagerCalls.endsWith(';')) {
        eagerCalls = '$eagerCalls;';
      }
      return 'TuraContainer(){$eagerCalls}';
    }
  }
}
