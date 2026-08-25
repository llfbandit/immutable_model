## 2.1.0
- Add `ignoreMutable` annotation parameters to skip immutability check.

## 2.0.0
- chore: Version bump to align with `im_model_gen` 2.0.0 (chained/deep `copyWith` support). No other breaking changes in this package itself.
- chore: Updated the SDK lower bound to 3.13.0.

## 1.4.0
- feat: Improve ImList/ImMap/ImSet performance (faster than built_collection!).
- feat: Improve collection API: ImList.+ accepts any Iterable<E> instead of only ImList<E>
- fix: CopyOnWriteSet.union/intersection/difference return CopyOnWriteSet<E>
- fix: ImMap.== can falsely equate maps with null values.
- chore: Added benchmarks to compare with built_collection.
- chore: Add tests for 100% code coverage.
- chore: Updated the SDK lower bound to 3.12.0.
- chore: Updated README.md.

## 1.3.0
- chore: Updated the SDK lower bound to 3.8.

## 1.2.1
- fix: lower meta dependency bounds.

## 1.2.0
- chore: Updated the SDK lower bound to 3.6.
- chore: Updated dependencies.

## 1.1.1
- fix: Remove empty constructor as const.

## 1.1.0
- feat: Remove equality methods.

## 1.0.3
- fix: Equality on collections ImList/ImSet/ImMap.
- chore: remove collection package.

## 1.0.2
- fix: Reworked collections to not extend List/Set/Map bases and internally use copy on write Google implementations.

## 1.0.1
- chore: cleanup dev dependencies.
- chore: lower test dependency bounds.

## 1.0.0
- Initial version.