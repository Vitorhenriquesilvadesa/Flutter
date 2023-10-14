import 'dart:convert';
import 'package:crypto/crypto.dart';

class Password {
  final String _encryptedPassword;

  Password(String password) : _encryptedPassword = _encryptPassword(password);

  String get encryptedPassword => _encryptedPassword;

  static String _encryptPassword(String password) {
    final bytes = utf8.encode(password);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
}
