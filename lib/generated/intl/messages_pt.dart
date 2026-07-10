// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pt locale. All the
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
  String get localeName => 'pt';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "NoNewsFound": MessageLookupByLibrary.simpleMessage(
      "Nenhuma notícia encontrada!",
    ),
    "TryAgain": MessageLookupByLibrary.simpleMessage("Tentar novamente"),
    "ViewAll": MessageLookupByLibrary.simpleMessage("Ver tudo"),
    "WelcomeText": MessageLookupByLibrary.simpleMessage(
      "Bom dia\nAqui estão algumas notícias para você",
    ),
    "goHome": MessageLookupByLibrary.simpleMessage("Ir para o início"),
    "home": MessageLookupByLibrary.simpleMessage("Início"),
    "language": MessageLookupByLibrary.simpleMessage("Idioma"),
    "noConnection": MessageLookupByLibrary.simpleMessage("Sem conexão!"),
    "noResultsFound": MessageLookupByLibrary.simpleMessage(
      "Nenhum resultado encontrado!",
    ),
    "search": MessageLookupByLibrary.simpleMessage("Pesquisar"),
    "theme": MessageLookupByLibrary.simpleMessage("Tema"),
    "viewFullArticle": MessageLookupByLibrary.simpleMessage(
      "Ver artigo completo",
    ),
  };
}
