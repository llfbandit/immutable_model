import 'package:meta/meta_meta.dart';

/// Annotation used to indicate that the model will be immutable.
@Target({TargetKind.classType})
class ImModel {
  const ImModel({
    this.copyConstructor,
    this.ignoreCopy = false,
    this.ignoreEqual = false,
    this.ignoreMutable = false,
  });

  /// Used when a named constructor should instead of the default for copies of
  /// your model.
  final String? copyConstructor;

  /// Prevent the generation of `copyWith` method but fields annotated with
  /// `ImField(ignoreCopy: false)`.
  final bool ignoreCopy;

  /// Prevent the generation of == (equal) operator but fields annotated with
  /// `ImField(ignoreEqual: false)`.
  final bool ignoreEqual;

  /// Skip immutability validation for the whole class but fields annotated
  /// with `ImField(ignoreMutable: false)`.
  ///
  /// Use it when you're certain about the immutability of the class' fields,
  /// but the generator can't prove it structurally (e.g. a third-party type).
  final bool ignoreMutable;
}

/// Field related options for the class's `ImModel` annotation.
@Target({TargetKind.field})
class ImField {
  const ImField({this.ignoreCopy, this.ignoreEqual, this.ignoreMutable});

  /// Prevent the field to be generated for `copyWith` method.
  ///
  /// It supersedes the class annotation if needed.
  final bool? ignoreCopy;

  /// Prevent the field to be compared on == (equal) operator.
  ///
  /// It supersedes the class annotation if needed.
  final bool? ignoreEqual;

  /// Skip immutability validation for this field.
  ///
  /// It supersedes the class annotation if needed.
  final bool? ignoreMutable;
}
