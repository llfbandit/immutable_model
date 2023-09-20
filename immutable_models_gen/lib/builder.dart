import 'package:build/build.dart' show Builder, BuilderOptions;
import 'package:immutable_models_gen/src/immutable_model_generator.dart';
import 'package:source_gen/source_gen.dart' show SharedPartBuilder;

/// Builds generators for `build_runner` to run
Builder immutableModelGen(BuilderOptions config) {
  return SharedPartBuilder(
    [
      ImmutableModelGenerator(),
    ],
    'immutable_models_gen',
  );
}
