/// Provides `Immutable` annotation classes.
library immutable;

import 'package:meta/meta_meta.dart';

/// Annotation used to indicate that the model will be immutable.
@Target({TargetKind.classType})
class ImModel {
  const ImModel({
    this.copyConstructor,
    this.ignoreCopy = false,
    this.ignoreEqual = false,
  });

  /// Used when a named constructor should instead of the default for copies of
  /// your model.
  final String? copyConstructor;

  /// Prevent the generation of `copyWith` method but fields annotated with
  /// `ImField(ignoreCopy: false)`.
  final bool ignoreCopy;

  /// Prevent the generation of == (equal) operator but fields annotated with
  /// `ImField(ignoreEqual: ignoreCopy)`.
  final bool ignoreEqual;
}

/// Field related options for the class's `ImModel` annotation.
@Target({TargetKind.field})
class ImField {
  const ImField({
    this.ignoreCopy,
    this.ignoreEqual,
  });

  /// Prevent the field to be generated for `copyWith` method.
  ///
  /// It superseeds the class annotation if needed.
  final bool? ignoreCopy;

  /// Prevent the field to be compared on == (equal) operator.
  ///
  /// It superseeds the class annotation if needed.
  final bool? ignoreEqual;
}

/// This is a placeholder object for fields with nullable values.
class $ImCopy {
  const $ImCopy();
}
