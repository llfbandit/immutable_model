import 'package:immutable_model/immutable_model.dart';

/// The internal representation of `ImmutableModel` annotation.
class ImmutableModelAnnotation implements ImModel {
  const ImmutableModelAnnotation({
    this.copyConstructor,
    this.ignoreCopy = false,
    this.ignoreEqual = false,
  });

  @override
  final String? copyConstructor;

  @override
  final bool ignoreCopy;

  @override
  final bool ignoreEqual;
}

/// The internal representation of `ImmutableModelField` annotation.
class ImmutableModelFieldAnnotation implements ImField {
  const ImmutableModelFieldAnnotation({
    this.ignoreCopy,
    this.ignoreEqual,
  });

  @override
  final bool? ignoreCopy;

  @override
  final bool? ignoreEqual;
}
