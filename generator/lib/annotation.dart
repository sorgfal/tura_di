class TuraFactory {
  final bool singletone;
  final Type? cast;
  final bool eagerSingletone;
  final bool async;

  const TuraFactory(
      {this.singletone = false,
      this.cast,
      this.eagerSingletone = false,
      this.async = false});

  @override
  String toString() => 'depFactory';
}

const turaFactory = TuraFactory();

class TuraContainer {
  const TuraContainer();
  @override
  String toString() => 'depInitializer';
}

const turaCon = TuraContainer();
