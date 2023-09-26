import 'package:im_model/im_model.dart';
import 'package:test/test.dart' hide equals;

part 'generic_test.g.dart';

@ImModel()
class Generics<G, T extends Iterable<G>> with _$GenericsMixin<G, T> {
  const Generics({
    required this.basicGeneric,
    required this.genericTemplate,
    this.deepNestedGeneric,
    required this.nullableGeneric,
  });

  final ImList<int> basicGeneric;
  final ImList<T> genericTemplate;
  final ImList<String?> nullableGeneric;
  final ImList<ImList<ImList<int?>?>>? deepNestedGeneric;
}

void main() {
  test('Generics', () {
    const generic = Generics<bool, ImList<bool>>(
      basicGeneric: ImList.empty(),
      genericTemplate: ImList.empty(),
      nullableGeneric: ImList.empty(),
      deepNestedGeneric: ImList.empty(),
    );

    expect(
      generic.basicGeneric.runtimeType,
      ImList<int>,
    );

    expect(
      generic.genericTemplate.runtimeType,
      ImList<ImList<bool>>,
    );

    expect(
      generic
          .copyWith(
            genericTemplate: [
              [true].immut
            ],
          )
          .genericTemplate
          .runtimeType,
      ImList<ImList<bool>>,
    );

    expect(
      generic
          .copyWith(genericTemplate: [
            [true].immut
          ])
          .genericTemplate
          .first
          .first,
      true,
    );

    expect(
      generic.nullableGeneric.runtimeType,
      ImList<String?>,
    );

    expect(
      generic.copyWith(nullableGeneric: []).nullableGeneric.runtimeType,
      ImList<String?>,
    );

    expect(
      generic.copyWith(nullableGeneric: ['1', null, '2']).nullableGeneric,
      ['1', null, '2'],
    );

    expect(
      generic.deepNestedGeneric.runtimeType,
      ImList<ImList<ImList<int?>?>>,
    );

    expect(
      generic
          .copyWith(deepNestedGeneric: const [])
          .deepNestedGeneric
          .runtimeType,
      ImList<ImList<ImList<int?>?>>,
    );
  });
}
