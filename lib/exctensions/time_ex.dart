import 'package:timeago/timeago.dart' as timeago;

extension TimeAgoExtension on String {
  String toTimeAgo() {
    try {
      final date = DateTime.parse(this);
      return timeago.format(date);
    } catch (e) {
      return this;
    }
  }
}
