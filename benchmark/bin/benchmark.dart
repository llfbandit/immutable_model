import 'package:benchmark_harness/benchmark_harness.dart';
import 'package:built_collection/built_collection.dart';
import 'package:im_model/im_model.dart';

const _size = 100;

final _ints = List.generate(_size, (i) => i);
final _pairs = List.generate(_size, (i) => MapEntry(i, i));

// Prevents the compiler from eliminating iteration loops as dead code.
// ignore: unused_element
var _sink = 0;

// ---------------------------------------------------------------------------
// List — creation
// ---------------------------------------------------------------------------

class ImListCreateBenchmark extends BenchmarkBase {
  ImListCreateBenchmark() : super('ImList.create(${"$_size items"})');

  @override
  void run() => ImList(_ints);
}

class BuiltListCreateBenchmark extends BenchmarkBase {
  BuiltListCreateBenchmark() : super('BuiltList.create(${"$_size items"})');

  @override
  void run() => BuiltList<int>(_ints);
}

// ---------------------------------------------------------------------------
// List — equality
// ---------------------------------------------------------------------------

class ImListEqualityBenchmark extends BenchmarkBase {
  ImListEqualityBenchmark() : super('ImList.equality(${"$_size items"})');
  late ImList<int> a, b;

  @override
  void setup() {
    a = ImList(_ints);
    b = ImList(_ints);
  }

  @override
  void run() => a == b;
}

class BuiltListEqualityBenchmark extends BenchmarkBase {
  BuiltListEqualityBenchmark() : super('BuiltList.equality(${"$_size items"})');
  late BuiltList<int> a, b;

  @override
  void setup() {
    a = BuiltList<int>(_ints);
    b = BuiltList<int>(_ints);
  }

  @override
  void run() => a == b;
}

// ---------------------------------------------------------------------------
// List — hashCode
// ---------------------------------------------------------------------------

class ImListHashCodeBenchmark extends BenchmarkBase {
  ImListHashCodeBenchmark() : super('ImList.hashCode(${"$_size items"})');
  late ImList<int> list;

  @override
  void setup() => list = ImList(_ints);

  @override
  // Each run creates a new instance to bypass the cache.
  void run() => ImList(_ints).hashCode;
}

class BuiltListHashCodeBenchmark extends BenchmarkBase {
  BuiltListHashCodeBenchmark() : super('BuiltList.hashCode(${"$_size items"})');

  @override
  void run() => BuiltList<int>(_ints).hashCode;
}

// ---------------------------------------------------------------------------
// List — iteration
// ---------------------------------------------------------------------------

class ImListIterationBenchmark extends BenchmarkBase {
  ImListIterationBenchmark() : super('ImList.iteration(${"$_size items"})');
  late ImList<int> list;

  @override
  void setup() => list = ImList(_ints);

  @override
  void run() {
    var sum = 0;
    for (final v in list) {
      sum += v;
    }
    _sink = sum;
  }
}

class BuiltListIterationBenchmark extends BenchmarkBase {
  BuiltListIterationBenchmark()
    : super('BuiltList.iteration(${"$_size items"})');
  late BuiltList<int> list;

  @override
  void setup() => list = BuiltList<int>(_ints);

  @override
  void run() {
    var sum = 0;
    for (final v in list) {
      sum += v;
    }
    _sink = sum;
  }
}

// ---------------------------------------------------------------------------
// Map — creation
// ---------------------------------------------------------------------------

class ImMapCreateBenchmark extends BenchmarkBase {
  ImMapCreateBenchmark() : super('ImMap.create(${"$_size items"})');

  @override
  void run() => ImMap(Map.fromEntries(_pairs));
}

class BuiltMapCreateBenchmark extends BenchmarkBase {
  BuiltMapCreateBenchmark() : super('BuiltMap.create(${"$_size items"})');

  @override
  void run() => BuiltMap<int, int>(Map.fromEntries(_pairs));
}

// ---------------------------------------------------------------------------
// Map — equality
// ---------------------------------------------------------------------------

class ImMapEqualityBenchmark extends BenchmarkBase {
  ImMapEqualityBenchmark() : super('ImMap.equality(${"$_size items"})');
  late ImMap<int, int> a, b;

  @override
  void setup() {
    a = ImMap(Map.fromEntries(_pairs));
    b = ImMap(Map.fromEntries(_pairs));
  }

  @override
  void run() => a == b;
}

class BuiltMapEqualityBenchmark extends BenchmarkBase {
  BuiltMapEqualityBenchmark() : super('BuiltMap.equality(${"$_size items"})');
  late BuiltMap<int, int> a, b;

  @override
  void setup() {
    a = BuiltMap<int, int>(Map.fromEntries(_pairs));
    b = BuiltMap<int, int>(Map.fromEntries(_pairs));
  }

  @override
  void run() => a == b;
}

// ---------------------------------------------------------------------------
// Map — hashCode
// ---------------------------------------------------------------------------

class ImMapHashCodeBenchmark extends BenchmarkBase {
  ImMapHashCodeBenchmark() : super('ImMap.hashCode(${"$_size items"})');

  @override
  void run() => ImMap(Map.fromEntries(_pairs)).hashCode;
}

class BuiltMapHashCodeBenchmark extends BenchmarkBase {
  BuiltMapHashCodeBenchmark() : super('BuiltMap.hashCode(${"$_size items"})');

  @override
  void run() => BuiltMap<int, int>(Map.fromEntries(_pairs)).hashCode;
}

// ---------------------------------------------------------------------------
// Map — iteration
// ---------------------------------------------------------------------------

class ImMapIterationBenchmark extends BenchmarkBase {
  ImMapIterationBenchmark() : super('ImMap.iteration(${"$_size items"})');
  late ImMap<int, int> map;

  @override
  void setup() => map = ImMap(Map.fromEntries(_pairs));

  @override
  void run() {
    var sum = 0;
    for (final e in map.entries) {
      sum += e.value;
    }
    _sink = sum;
  }
}

class BuiltMapIterationBenchmark extends BenchmarkBase {
  BuiltMapIterationBenchmark() : super('BuiltMap.iteration(${"$_size items"})');
  late BuiltMap<int, int> map;

  @override
  void setup() => map = BuiltMap<int, int>(Map.fromEntries(_pairs));

  @override
  void run() {
    var sum = 0;
    for (final e in map.entries) {
      sum += e.value;
    }
    _sink = sum;
  }
}

// ---------------------------------------------------------------------------
// Set — creation
// ---------------------------------------------------------------------------

class ImSetCreateBenchmark extends BenchmarkBase {
  ImSetCreateBenchmark() : super('ImSet.create(${"$_size items"})');

  @override
  void run() => ImSet(_ints);
}

class BuiltSetCreateBenchmark extends BenchmarkBase {
  BuiltSetCreateBenchmark() : super('BuiltSet.create(${"$_size items"})');

  @override
  void run() => BuiltSet<int>(_ints);
}

// ---------------------------------------------------------------------------
// Set — equality
// ---------------------------------------------------------------------------

class ImSetEqualityBenchmark extends BenchmarkBase {
  ImSetEqualityBenchmark() : super('ImSet.equality(${"$_size items"})');
  late ImSet<int> a, b;

  @override
  void setup() {
    a = ImSet(_ints);
    b = ImSet(_ints);
  }

  @override
  void run() => a == b;
}

class BuiltSetEqualityBenchmark extends BenchmarkBase {
  BuiltSetEqualityBenchmark() : super('BuiltSet.equality(${"$_size items"})');
  late BuiltSet<int> a, b;

  @override
  void setup() {
    a = BuiltSet<int>(_ints);
    b = BuiltSet<int>(_ints);
  }

  @override
  void run() => a == b;
}

// ---------------------------------------------------------------------------
// Set — hashCode
// ---------------------------------------------------------------------------

class ImSetHashCodeBenchmark extends BenchmarkBase {
  ImSetHashCodeBenchmark() : super('ImSet.hashCode(${"$_size items"})');

  @override
  void run() => ImSet(_ints).hashCode;
}

class BuiltSetHashCodeBenchmark extends BenchmarkBase {
  BuiltSetHashCodeBenchmark() : super('BuiltSet.hashCode(${"$_size items"})');

  @override
  void run() => BuiltSet<int>(_ints).hashCode;
}

// ---------------------------------------------------------------------------
// Set — iteration
// ---------------------------------------------------------------------------

class ImSetIterationBenchmark extends BenchmarkBase {
  ImSetIterationBenchmark() : super('ImSet.iteration(${"$_size items"})');
  late ImSet<int> set;

  @override
  void setup() => set = ImSet(_ints);

  @override
  void run() {
    var sum = 0;
    for (final v in set) {
      sum += v;
    }
    _sink = sum;
  }
}

class BuiltSetIterationBenchmark extends BenchmarkBase {
  BuiltSetIterationBenchmark() : super('BuiltSet.iteration(${"$_size items"})');
  late BuiltSet<int> set;

  @override
  void setup() => set = BuiltSet<int>(_ints);

  @override
  void run() {
    var sum = 0;
    for (final v in set) {
      sum += v;
    }
    _sink = sum;
  }
}

// ---------------------------------------------------------------------------
// Runner
// ---------------------------------------------------------------------------

typedef _Case = (String op, BenchmarkBase im, BenchmarkBase built);

String _fmt(double us) {
  if (us >= 1000) return '${(us / 1000).toStringAsFixed(2)} ms';
  return '${us.toStringAsFixed(2)} µs';
}

void _section(String label, List<_Case> cases) {
  const colOp = 10;
  const colTime = 14;
  const colBuilt = 18;

  print('\n$label ($_size items)');
  print(
    '  ${'operation'.padRight(colOp)}'
    '${'im_model'.padRight(colTime)}'
    '${'built_collection'.padRight(colBuilt)}'
    'ratio',
  );
  print('  ${'-' * (colOp + colTime + colBuilt + 12)}');

  for (final (op, im, built) in cases) {
    final imUs = im.measure();
    final builtUs = built.measure();
    final ratio = imUs / builtUs;

    final String verdict;
    if (ratio < 0.95) {
      verdict = '${(1 / ratio).toStringAsFixed(1)}x faster';
    } else if (ratio > 1.05) {
      verdict = '${ratio.toStringAsFixed(1)}x slower';
    } else {
      verdict = 'same';
    }

    print(
      '  ${op.padRight(colOp)}'
      '${_fmt(imUs).padRight(colTime)}'
      '${_fmt(builtUs).padRight(colBuilt)}'
      '$verdict',
    );
  }
}

void main() {
  _section('List', [
    ('create', ImListCreateBenchmark(), BuiltListCreateBenchmark()),
    ('equality', ImListEqualityBenchmark(), BuiltListEqualityBenchmark()),
    ('hashCode', ImListHashCodeBenchmark(), BuiltListHashCodeBenchmark()),
    ('iteration', ImListIterationBenchmark(), BuiltListIterationBenchmark()),
  ]);

  _section('Map', [
    ('create', ImMapCreateBenchmark(), BuiltMapCreateBenchmark()),
    ('equality', ImMapEqualityBenchmark(), BuiltMapEqualityBenchmark()),
    ('hashCode', ImMapHashCodeBenchmark(), BuiltMapHashCodeBenchmark()),
    ('iteration', ImMapIterationBenchmark(), BuiltMapIterationBenchmark()),
  ]);

  _section('Set', [
    ('create', ImSetCreateBenchmark(), BuiltSetCreateBenchmark()),
    ('equality', ImSetEqualityBenchmark(), BuiltSetEqualityBenchmark()),
    ('hashCode', ImSetHashCodeBenchmark(), BuiltSetHashCodeBenchmark()),
    ('iteration', ImSetIterationBenchmark(), BuiltSetIterationBenchmark()),
  ]);

  print('');
}
