part of 'index.dart';

@ShouldGenerate(r'''
extension _$ParentImExt<T> on Parent<T> {
  dynamic _eq() => (id);
}

mixin _$ParentMixin<T> {
  $IParentCopy<T, Parent<T>> get copyWith =>
      $ParentCopy(this as Parent<T>, (v) => v);

  @override
  int get hashCode => (this as Parent)._eq().hashCode;

  @override
  bool operator ==(covariant Parent<T> other) {
    if (identical(this, other)) return true;
    return other._eq() == (this as Parent)._eq();
  }

  @override
  String toString() => (this as Parent)._eq().toString();
}

abstract interface class $IParentCopy<T, $R> {
  $R call({T? aValue});
}

class $ParentCopy<T, $R> implements $IParentCopy<T, $R> {
  const $ParentCopy(this._value, this._then);

  final Parent<T> _value;
  final $R Function(Parent<T>) _then;

  @override
  $R call({Object? aValue = $undefined}) {
    return _then(
      Parent<T>(_value.id, $undefined == aValue ? _value.aValue : aValue as T?),
    );
  }
}
''')
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
  $IChildCopy<T, Child<T>> get copyWith =>
      $ChildCopy(this as Child<T>, (v) => v);

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

abstract interface class $IChildCopy<T, $R> implements $IParentCopy<T, $R> {
  @override
  $R call({T? aValue, List<int>? collection});
}

class $ChildCopy<T, $R> implements $IChildCopy<T, $R> {
  const $ChildCopy(this._value, this._then);

  final Child<T> _value;
  final $R Function(Child<T>) _then;

  @override
  $R call({Object? aValue = $undefined, Object? collection = $undefined}) {
    return _then(
      Child<T>(
        _value.id,
        $undefined == aValue ? _value.aValue : aValue as T?,
        collection: $undefined == collection || collection == null
            ? _value.collection
            : ImList(collection as List<int>),
      ),
    );
  }
}
''')
@ImModel()
class Child<T> extends Parent<T> {
  const Child(super.id, super.aValue, {required this.collection});

  final ImList<int> collection;
}
