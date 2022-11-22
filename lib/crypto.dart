import 'dart:convert';
import 'dart:math';
import 'package:encrypt/encrypt.dart';

class EncryptData {
  static String randomkey = "";
  static String decrypted = "";
  static Encrypted? encrypted;

  static void genRandomKey() {
    randomkey = base64UrlEncode(
        List<int>.generate(24, (index) => Random.secure().nextInt(255)));
  }

  static encrypt(String data) {
    final key = Key.fromUtf8(randomkey);
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));
    encrypted = encrypter.encrypt(data, iv: iv);
  }

  static decrypt(String enData) {
    final key = Key.fromUtf8(randomkey);
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));
    decrypted = encrypter.decrypt(Encrypted.from64(enData), iv: iv);
  }
}
