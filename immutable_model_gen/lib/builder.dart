library immutable_model_gen;

import 'package:build/build.dart' show Builder, BuilderOptions;
import 'package:immutable_model_gen/src/immutable_model_generator.dart';
import 'package:source_gen/source_gen.dart' show SharedPartBuilder;

Builder copyWith(BuilderOptions config) {
  return SharedPartBuilder(
    [
      ImmutableModelGenerator(),
    ],
    'immutable_model',
  );
}
