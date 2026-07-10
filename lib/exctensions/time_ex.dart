import 'package:timeago/timeago.dart' as timeago;

extension TimeAgoExtension on String {
  String toTimeAgo({String? locale}) {
    try {
      final date = DateTime.parse(this);
      final localDate = date.isUtc ? date.toLocal() : date;
      return timeago.format(localDate, locale: locale ?? 'ar');
    } catch (e) {
      return this;
    }
  }
}
