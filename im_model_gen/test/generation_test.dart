import 'package:build/experiments.dart';
import 'package:im_model/im_model.dart';
import 'package:im_model_gen/src/immutable_model_generator.dart';
import 'package:source_gen_test/source_gen_test.dart';

Future<void> main() async {
  await withEnabledExperiments(
    () async {
      final reader = await initializeLibraryReaderForDirectory(
        'test/gen_test_cases',
        'index.dart',
      );

      initializeBuildLogTracking();

      testAnnotatedElements<ImModel>(
        reader,
        ImmutableModelGenerator(),
      );
    },
    ['primary-constructors'],
  );
}
