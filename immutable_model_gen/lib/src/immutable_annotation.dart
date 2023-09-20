import 'package:immutable_model/immutable_model.dart';

/// The internal representation of `ImModel` annotation.
class ImModelAnnotation implements ImModel {
  const ImModelAnnotation({
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

/// The internal representation of `ImField` annotation.
class ImFieldAnnotation implements ImField {
  const ImFieldAnnotation({
    this.ignoreCopy,
    this.ignoreEqual,
  });

  @override
  final bool? ignoreCopy;

  @override
  final bool? ignoreEqual;
}
