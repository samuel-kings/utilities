import 'dart:math';

/// Generate a random code of the given length, default is 6.
/// This can be used for generating OTPs, verification codes, referral codes, IDs, etc.
String codeGenerator(int length) {
  const String characters = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  String result = '';
  for (var i = 0; i < length; i++) {
    result += characters[Random().nextInt(characters.length)];
  }
  return result;
}