import 'package:bad_words/bad_words.dart';

class BadWords {
  final _filter = Filter();

  /// Check if the given text contains bad words
  bool hasBadWords(String text) {
    return _filter.isProfane(text);
  }

  /// Check if the given list of text contains bad words
  bool hasBadWordsInList(List<String> list) {
    for (var text in list) {
      if (hasBadWords(text)) {
        return true;
      }
    }
    return false;
  }

  /// Remove bad words from the given text
  String removeBadWords(String text) {
    return _filter.clean(text);
  }

  /// Remove bad words from the given list of text
  List<String> removeBadWordsInList(List<String> list) {
    return list.map((text) => removeBadWords(text)).toList();
  }
}
