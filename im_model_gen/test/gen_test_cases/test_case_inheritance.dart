part of 'index.dart';

@ImModel(ignoreEqual: true, ignoreCopy: true)
class Parent<T> {
  const Parent(this.id, this.aValue);

  @ImField(ignoreEqual: false)
  final String id;
  @ImField(ignoreCopy: false)
  final T? aValue;
}

@ShouldGenerate(r'''
extension $ChildImExt<T> on Child<T> {
  List<Object?> get _$props => [collection];

  // ignore: library_private_types_in_public_api
  _$IChildCopy<T> get copyWith => _$ChildCopy<T>(this);
}

mixin _$ChildMixin on IEquatable {
  @override
  List<Object?> get props =>
      [...super.props, ...$ChildImExt(this as Child)._$props];

  @override
  int get hashCode => const Hash().hash(this, props);

  @override
  bool operator ==(Object other) => eq(this, other);
}

abstract interface class _$IChildCopy<T> {
  Child<T> call({
    T? aValue,
    List<int>? collection,
  });
}

class _$ChildCopy<T> implements _$IChildCopy<T> {
  const _$ChildCopy(this._value);

  final Child<T> _value;

  @override
  Child<T> call({
    Object? aValue = const $ImCopy(),
    Object? collection = const $ImCopy(),
  }) {
    return Child<T>(
      _value.id,
      aValue == const $ImCopy() ? _value.aValue : aValue as T?,
      collection: collection == const $ImCopy() || collection == null
          ? _value.collection
          : ImList(collection as List<int>),
    );
  }
}
''')
@ImModel()
class Child<T> extends Parent<T> {
  const Child(super.id, super.aValue, {required this.collection});

  final ImList<int> collection;
}
