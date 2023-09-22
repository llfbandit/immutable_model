abstract class IEquatable {
  /// The properties to be checked for equality.
  List<Object?> get props;

  /// Joined string of equality props.
  @override
  String toString() {
    return '$runtimeType(${props.map((prop) => prop.toString()).join(', ')})';
  }
}
