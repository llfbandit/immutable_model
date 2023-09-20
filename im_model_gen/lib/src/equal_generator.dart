import 'package:analyzer/dart/element/element.dart';
import 'package:im_model_gen/src/class_hierarchy_info.dart';
import 'package:im_model_gen/src/gen_result.dart';
import 'package:im_model_gen/src/immutable_annotation.dart';

class _EqualMixinTemplate {
  const _EqualMixinTemplate();

  GenResult generate(
    InterfaceElement classElement, {
    required String extensionName,
    required bool genSuperProps,
    required String props,
  }) {
    final className = classElement.name;
    final mixinName = '_\$${className}Mixin';

    final superProps = genSuperProps ? '...super.props,' : '';

    final on = genSuperProps ? 'on' : 'implements';
    final open = genSuperProps ? '[' : '';
    final close = genSuperProps ? ']' : '';
    final spreadOp = genSuperProps ? '...' : '';

    final generatedCode = '''
      mixin $mixinName $on IEquatable {
        @override
        List<Object?> get props => $open$superProps$spreadOp$extensionName(this as $className)._\$props$close;

        @override
        int get hashCode => const Hash().hash(this, props);

        @override
        bool operator ==(Object other) => eq(this, other);
      }
      ''';

    final extensionCode = 'List<Object?> get _\$props => [$props];';

    return GenResult(
      generatedCode: generatedCode,
      extensionCode: extensionCode,
    );
  }
}

class EqualGenerator {
  const EqualGenerator();

  Future<GenResult> generate(
    ClassInfo classInfo, {
    required String extensionName,
  }) async {
    return const _EqualMixinTemplate().generate(
      classInfo.element,
      extensionName: extensionName,
      genSuperProps: classInfo.superClass != null,
      props: _generateEquality(classInfo),
    );
  }

  String _generateEquality(ClassInfo classInfo) {
    return classInfo.fields
        .where((field) => _includeField(classInfo.annotation, field))
        .map((field) => field.element.name)
        .join(',');
  }

  bool _includeField(
    ImModelAnnotation classAnnotation,
    FieldInfo field,
  ) {
    if (field.element.isStatic) return false;
    if (field.element.isSynthetic) return false; // Getters
    if (field.element.getter == null) return false;
    if (field.element.name == 'props') return false;

    if (field.annotation != null) {
      return !(field.annotation!.ignoreEqual ?? classAnnotation.ignoreEqual);
    } else {
      return !classAnnotation.ignoreEqual;
    }
  }
}
