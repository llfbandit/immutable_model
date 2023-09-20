import 'package:collection/collection.dart';
import 'package:im_model/src/equality/equality_interface.dart';

const _dce = DeepCollectionEquality();

bool eq(IEquatable main, Object other) {
  return identical(main, other) ||
      (other is IEquatable &&
          main.runtimeType == other.runtimeType &&
          _equals(main, other));
}

bool _equals(IEquatable main, IEquatable other) {
  final props = main.props;
  final otherProps = other.props;

  final length = props.length;
  if (length != otherProps.length) return false;

  for (var i = 0; i < length; i++) {
    final prop = props[i];
    final otherProp = otherProps[i];

    if (prop is IEquatable && otherProp is IEquatable) {
      return eq(prop, otherProp);
    } else if (prop?.runtimeType != otherProp?.runtimeType) {
      return false;
    } else if (_dce.isValidKey(prop)) {
      if (!_dce.equals(prop, otherProp)) return false;
    } else if (prop != otherProp) {
      return false;
    }
  }

  return true;
}
