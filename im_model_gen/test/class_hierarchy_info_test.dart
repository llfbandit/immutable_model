import 'package:analyzer/dart/constant/value.dart';
import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:im_model/im_model.dart';
import 'package:im_model_gen/src/class_hierarchy_info.dart';
import 'package:source_gen/source_gen.dart';
import 'package:test/test.dart';

void main() {
  test(
    'getClassInfo validates immutability even when a class is resolved only '
    'through nested-field discovery, never through its own annotated pass '
    '(as ImmutableModelGenerator.generateForAnnotatedElement normally does)',
    () async {
      Future<void> action(Resolver resolver) async {
        final library = await resolver.findLibraryByName('test_lib');
        final element = library!.classes.firstWhere((c) => c.name == 'Invalid');

        const checker = TypeChecker.typeNamed(ImModel);
        final annotation = checker.firstAnnotationOf(element);
        expect(annotation, isA<DartObject>());

        expect(
          () => ClassHierarchyInfo().getClassInfo(
            element,
            ConstantReader(annotation),
          ),
          throwsA(
            isA<InvalidGenerationSourceError>().having(
              (e) => e.message,
              'message',
              contains('is not final or const to ensure immutability'),
            ),
          ),
        );
      }

      await resolveSource<void>(
        '''
        library test_lib;

        import 'package:im_model/im_model.dart';

        @ImModel()
        class Invalid {
          Invalid(this.value);

          int value;
        }
      ''',
        action,
        inputId: AssetId('im_model_gen', 'lib/_class_hierarchy_info_test.dart'),
        readAllSourcesFromFilesystem: true,
      );
    },
  );

  test(
    'getClassInfo does not cache a class that fails validation — a second '
    'call for the same class re-validates and throws again, rather than '
    'silently returning a poisoned cache entry from the first attempt',
    () async {
      Future<void> action(Resolver resolver) async {
        final library = await resolver.findLibraryByName('test_lib');
        final element = library!.classes.firstWhere((c) => c.name == 'Invalid');

        const checker = TypeChecker.typeNamed(ImModel);
        final annotation = checker.firstAnnotationOf(element);
        expect(annotation, isA<DartObject>());
        final reader = ConstantReader(annotation);

        final hierarchy = ClassHierarchyInfo();

        expect(
          () => hierarchy.getClassInfo(element, reader),
          throwsA(isA<InvalidGenerationSourceError>()),
        );
        expect(
          () => hierarchy.getClassInfo(element, reader),
          throwsA(isA<InvalidGenerationSourceError>()),
        );
      }

      await resolveSource<void>(
        '''
        library test_lib;

        import 'package:im_model/im_model.dart';

        @ImModel()
        class Invalid {
          Invalid(this.value);

          int value;
        }
      ''',
        action,
        inputId: AssetId(
          'im_model_gen',
          'lib/_class_hierarchy_info_test2.dart',
        ),
        readAllSourcesFromFilesystem: true,
      );
    },
  );
}
