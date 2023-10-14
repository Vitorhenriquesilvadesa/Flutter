class Address {
  String street;
  String number;
  String complement;
  String neighborhood;
  String city;
  String zipCode;

  Address({
    required this.street,
    required this.number,
    this.complement = "",
    required this.neighborhood,
    required this.city,
    required this.zipCode,
  });

  @override
  String toString() {
    return '$number ${complement.isEmpty ? '' : '$complement, '}$street\n$neighborhood\n$city\n$zipCode';
  }
}
