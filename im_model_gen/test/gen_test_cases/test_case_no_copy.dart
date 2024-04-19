part of 'index.dart';

@ShouldGenerate(r'''
extension _$NoCopyClassImExt<T extends Iterable<int>> on NoCopyClass<T> {
  dynamic _eq() => (id, optional, immutable, nullableImmutable);
}

mixin _$NoCopyClassMixin<T extends Iterable<int>> {
  @override
  int get hashCode => (this as NoCopyClass)._eq().hashCode;

  @override
  bool operator ==(covariant NoCopyClass<T> other) {
    if (identical(this, other)) return true;
    return other._eq() == (this as NoCopyClass)._eq();
  }

  @override
  String toString() => (this as NoCopyClass)._eq().toString();
}
''')
@ImModel(ignoreCopy: true)
class NoCopyClass<T extends Iterable<int>> {
  const NoCopyClass({
    required this.id,
    this.optional,
    required this.immutable,
    required this.nullableImmutable,
  });

  final String id;
  final T? optional;
  final int immutable;
  final int? nullableImmutable;
}
