class Phone {
  final String countryCode;
  final String areaCode;
  final String localNumber;

  Phone(
      {required this.countryCode,
      required this.areaCode,
      required this.localNumber});

  @override
  String toString() {
    return "+$countryCode ($areaCode) $localNumber";
  }
}
