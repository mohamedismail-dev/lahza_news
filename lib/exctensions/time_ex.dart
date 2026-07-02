import 'package:timeago/timeago.dart' as timeago;

extension TimeAgoExtension on String {
  String toTimeAgo() {
    try {
      final date = DateTime.parse(this);
      final localDate = date.isUtc ? date.toLocal() : date;
      return timeago.format(localDate);
    } catch (e) {
      return this;
    }
  }
}
