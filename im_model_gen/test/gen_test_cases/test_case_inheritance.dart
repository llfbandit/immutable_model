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
extension _$ChildImExt<T> on Child<T> {
  dynamic _eq() => (id, collection);
}

mixin _$ChildMixin<T> {
  _$IChildCopy<T> get copyWith => _$ChildCopy<T>(this as Child<T>);

  @override
  int get hashCode => (this as Child)._eq().hashCode;

  @override
  bool operator ==(covariant Child<T> other) {
    if (identical(this, other)) return true;
    return other._eq() == (this as Child)._eq();
  }

  @override
  String toString() => (this as Child)._eq().toString();
}

abstract interface class _$IChildCopy<T> {
  Child<T> call({T? aValue, List<int>? collection});
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
      const $ImCopy() == aValue ? _value.aValue : aValue as T?,
      collection:
          const $ImCopy() == collection || collection == null
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
