// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "NoNewsFound": MessageLookupByLibrary.simpleMessage("Новости не найдены!"),
    "TryAgain": MessageLookupByLibrary.simpleMessage("Повторить попытку"),
    "ViewAll": MessageLookupByLibrary.simpleMessage("Смотреть все"),
    "WelcomeText": MessageLookupByLibrary.simpleMessage(
      "Доброе утро\nВот немного новостей для вас",
    ),
    "goHome": MessageLookupByLibrary.simpleMessage("На главную"),
    "home": MessageLookupByLibrary.simpleMessage("Главная"),
    "language": MessageLookupByLibrary.simpleMessage("Язык"),
    "noConnection": MessageLookupByLibrary.simpleMessage("Нет подключения!"),
    "noResultsFound": MessageLookupByLibrary.simpleMessage(
      "Результаты не найдены!",
    ),
    "search": MessageLookupByLibrary.simpleMessage("Поиск"),
    "theme": MessageLookupByLibrary.simpleMessage("Тема"),
    "viewFullArticle": MessageLookupByLibrary.simpleMessage(
      "Просмотреть полную статью",
    ),
  };
}
