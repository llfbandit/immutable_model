import 'package:immutable_model/immutable_model.dart';
import 'package:test/test.dart' hide equals;

part 'collection_test.g.dart';

@ImModel()
class CopyList with _$CopyListMixin {
  const CopyList({required this.coll});

  final ImList<String> coll;
}

@ImModel()
class CopyMap with _$CopyMapMixin {
  const CopyMap({required this.coll});

  final ImMap<String, String> coll;
}

@ImModel()
class CopySet with _$CopySetMixin {
  const CopySet({required this.coll});

  final ImSet<String> coll;
}

@ImModel()
class CopyNestedList with _$CopyNestedListMixin {
  const CopyNestedList({required this.coll});

  final ImList<ImList<String>> coll;
}

void main() {
  test('CopyList', () {
    expect(
      const CopyList(coll: ImList.empty()).copyWith(coll: ['test']).coll,
      ['test'],
    );
  });

  test('CopyMap', () {
    expect(
      const CopyMap(coll: ImMap.empty()).copyWith(coll: {'test': 'test'}).coll,
      {'test': 'test'},
    );
  });

  test('CopySet', () {
    expect(
      const CopySet(coll: ImSet.empty()).copyWith(coll: {'test'}).coll,
      {'test'},
    );
  });

  test('CopyNestedList', () {
    expect(
      const CopyNestedList(coll: ImList.empty()).copyWith(coll: [
        ['test'].immut
      ]).coll,
      [
        ['test']
      ],
    );
  });
}
