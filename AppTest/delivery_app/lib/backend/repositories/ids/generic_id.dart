abstract class GenericID<T> {
  final T value;

  GenericID(this.value);

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(other) => other is GenericID<T> && other.value == value;

  @override
  String toString() => value.toString();
}
