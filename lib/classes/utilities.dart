import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sk_utilities/helpers/utils/bad_words.dart';
import 'package:sk_utilities/helpers/utils/change_web_page_title.dart';
import 'package:sk_utilities/helpers/utils/code_generator.dart';
import 'package:sk_utilities/helpers/utils/compress_image.dart';
import 'package:sk_utilities/helpers/utils/date_time_formatter.dart';
import 'package:sk_utilities/helpers/utils/secure_storage.dart';

/// This class contains all the utility functions and classes that are used in the app.
class Utilities {
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
