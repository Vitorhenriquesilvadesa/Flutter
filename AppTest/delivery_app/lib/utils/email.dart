class Email {
  final String username;
  final String domainName;

  Email({required this.username, required this.domainName});

  @override
  String toString() {
    return "$username@$domainName";
  }
}
