// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deep_copy_self_test.dart';

// **************************************************************************
// ImmutableModelGenerator
// **************************************************************************

extension _$GenreImExt on Genre {
  dynamic _eq() => (name, parent);
}

mixin _$GenreMixin {
  $IGenreCopy<Genre> get copyWith => $GenreCopy(this as Genre, (v) => v);

  @override
  int get hashCode => (this as Genre)._eq().hashCode;

  @override
  bool operator ==(covariant Genre other) {
    if (identical(this, other)) return true;
    return other._eq() == (this as Genre)._eq();
  }

  @override
  String toString() => (this as Genre)._eq().toString();
}

abstract interface class $IGenreCopy<$R> {
  $R call({String? name, Genre? parent});
  $IGenreCopy<$R>? get parent;
}

class $GenreCopy<$R> implements $IGenreCopy<$R> {
  const $GenreCopy(this._value, this._then);

  final Genre _value;
  final $R Function(Genre) _then;

  @override
  $R call({Object? name = $undefined, Object? parent = $undefined}) {
    return _then(
      Genre(
        name: $undefined == name || name == null ? _value.name : name as String,
        parent: $undefined == parent ? _value.parent : parent as Genre?,
      ),
    );
  }

  @override
  $IGenreCopy<$R>? get parent => _value.parent == null
      ? null
      : $GenreCopy(_value.parent!, (v) => _then(_value.copyWith(parent: v)));
}
