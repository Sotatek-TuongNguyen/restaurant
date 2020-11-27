import 'package:intl/intl.dart';

class Restaurant {
  final String id;
  final String title;
  final String thumb;
  final List days;

  Restaurant({this.id, this.title, this.thumb, this.days});

  Restaurant.fromJson(Map<String, dynamic> jsonObject)
      : id = jsonObject['id'],
        title = jsonObject['title'],
        thumb = jsonObject['thumb'],
        days = jsonObject['days'];

  Map<String, dynamic> toJson() =>
      {'id': id, 'title': title, 'thumb': thumb, 'days': days};

  String checkTime(days) {
    var now = new DateTime.now();
    final List weekdays = ["mon", "tue", "wed", "thu", "fri", "sat", "sun"];
    var nowday = weekdays[now.weekday - 1];
    var data = days.where((item) => item['type'] == nowday).toList();
    if (data.length > 0 && data[0]["open"] != "" && data[0]["close"] != "") {
      final startTime = DateTime.parse(
          '${now.year}-${now.month}-${now.day} ${data[0]["open"]}');
      final endTime = DateTime.parse(
          '${now.year}-${now.month}-${now.day} ${data[0]["close"]}');
      if (now.isAfter(startTime) && now.isBefore(endTime)) {
        return 'Opening';
      } else {
        return 'Closed';
      }
    }
    return 'Closed';
  }

  String showTime(day) {
    if (day != null &&
        !["", null].contains(day["open"]) &&
        !["", null].contains(day["close"])) {
      var now = new DateTime.now();
      final startTime =
          DateTime.parse('${now.year}-${now.month}-${now.day} ${day["open"]}');
      final endTime =
          DateTime.parse('${now.year}-${now.month}-${now.day} ${day["close"]}');
      return "${DateFormat.jm().format(startTime)} - ${DateFormat.jm().format(endTime)}";
    } else {
      return 'Closed';
    }
  }
}
