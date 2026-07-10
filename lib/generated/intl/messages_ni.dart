// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ni locale. All the
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
  String get localeName => 'ni';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "NoNewsFound": MessageLookupByLibrary.simpleMessage(
      "Geen nieuws gevonden!",
    ),
    "TryAgain": MessageLookupByLibrary.simpleMessage("Opnieuw proberen"),
    "ViewAll": MessageLookupByLibrary.simpleMessage("Alles bekijken"),
    "WelcomeText": MessageLookupByLibrary.simpleMessage(
      "Goedemorgen\nHier is wat nieuws voor jou",
    ),
    "goHome": MessageLookupByLibrary.simpleMessage("Ga naar startpagina"),
    "home": MessageLookupByLibrary.simpleMessage("Start"),
    "language": MessageLookupByLibrary.simpleMessage("Taal"),
    "noConnection": MessageLookupByLibrary.simpleMessage("Geen verbinding!"),
    "noResultsFound": MessageLookupByLibrary.simpleMessage(
      "Geen resultaten gevonden!",
    ),
    "search": MessageLookupByLibrary.simpleMessage("Zoeken"),
    "theme": MessageLookupByLibrary.simpleMessage("Thema"),
    "viewFullArticle": MessageLookupByLibrary.simpleMessage(
      "Volledig artikel bekijken",
    ),
  };
}
