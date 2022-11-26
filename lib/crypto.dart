import 'dart:convert';
import 'dart:math';
import 'package:encrypt/encrypt.dart';
import 'secret.dart';

class EncryptData {
  static String secret = secretKey;
  static String decrypted = "";
  static Encrypted? encrypted;

  static void genRandomKey() {
    secret = base64UrlEncode(
        List<int>.generate(24, (index) => Random.secure().nextInt(255)));
  }

  static encrypt(String data) {
    if (secret.isEmpty) throw Error();
    final key = Key.fromUtf8(secret);
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));
    encrypted = encrypter.encrypt(data, iv: iv);
  }

  static decrypt(String enData) {
    if (secret.isEmpty) throw Error();
    final key = Key.fromUtf8(secret);
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));
    decrypted = encrypter.decrypt(Encrypted.from64(enData), iv: iv);
  }
}
