import 'package:im_model/im_model.dart';

/// The internal representation of `ImModel` annotation.
class ImModelAnnotation implements ImModel {
  const ImModelAnnotation({
    this.copyConstructor,
    this.ignoreCopy = false,
    this.ignoreEqual = false,
    this.ignoreMutable = false,
  });

  @override
  final String? copyConstructor;

  @override
  final bool ignoreCopy;

  @override
  final bool ignoreEqual;

  @override
  final bool ignoreMutable;
}

/// The internal representation of `ImField` annotation.
class ImFieldAnnotation implements ImField {
  const ImFieldAnnotation({
    this.ignoreCopy,
    this.ignoreEqual,
    this.ignoreMutable,
  });

  @override
  final bool? ignoreCopy;

  @override
  final bool? ignoreEqual;

  @override
  final bool? ignoreMutable;
}
