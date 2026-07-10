// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh locale. All the
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
  String get localeName => 'zh';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "NoNewsFound": MessageLookupByLibrary.simpleMessage("未找到新闻！"),
    "TryAgain": MessageLookupByLibrary.simpleMessage("重试"),
    "ViewAll": MessageLookupByLibrary.simpleMessage("查看全部"),
    "WelcomeText": MessageLookupByLibrary.simpleMessage("早上好\n这里是为您准备的新闻"),
    "goHome": MessageLookupByLibrary.simpleMessage("返回主页"),
    "home": MessageLookupByLibrary.simpleMessage("主页"),
    "language": MessageLookupByLibrary.simpleMessage("语言"),
    "noConnection": MessageLookupByLibrary.simpleMessage("无网络连接！"),
    "noResultsFound": MessageLookupByLibrary.simpleMessage("未找到结果！"),
    "search": MessageLookupByLibrary.simpleMessage("搜索"),
    "theme": MessageLookupByLibrary.simpleMessage("主题"),
    "viewFullArticle": MessageLookupByLibrary.simpleMessage("查看完整文章"),
  };
}
