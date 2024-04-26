import 'package:intl/intl.dart';

extension DateTimeFormatting on DateTime? {
  String format() {
    if (this == null) return '';
    return DateFormat.yMMMMd().add_Hm().format(this!);
  }

  String formatWithTime() {
    if (this == null) return '';
    final difference = DateTime.now().difference(this!);
    if (difference.inDays > 0) {
      return 'Created ${difference.inDays} day${difference.inDays == 1 ? '' : 's'} ago';
    } else if (difference.inHours > 0) {
      return 'Created ${difference.inHours} hour${difference.inHours == 1 ? '' : 's'} ago';
    } else if (difference.inMinutes > 0) {
      return 'Created ${difference.inMinutes} minute${difference.inMinutes == 1 ? '' : 's'} ago';
    } else {
      return 'Created just now';
    }
  }
}
