import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:utilities/helpers/functions/bad_words.dart';
import 'package:utilities/helpers/functions/change_web_page_title.dart';
import 'package:utilities/helpers/functions/code_generator.dart';
import 'package:utilities/helpers/functions/compress_image.dart';
import 'package:utilities/helpers/functions/date_time_formatter.dart';
import 'package:utilities/helpers/functions/secure_storage.dart';

/// This class contains all the utility functions and classes that are used in the app.
class Functions {
  static BadWords get badWords => BadWords();

  static void changeWebPageTitle(String title) {
    changeWebPageTitle_(title);
  }

  static String generateCode([int length = 6]) {
    return codeGenerator(length);
  }

  static ImageCompressor get imageCompressor => ImageCompressor();

  static DateTimeFormatter get dateTimeFormatter => DateTimeFormatter();

  static FlutterSecureStorage get secureStorage => secStorage;
}
