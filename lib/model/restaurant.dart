import 'package:intl/intl.dart';

class Restaurant {
  final String name;
  final String operatingHours;

  Restaurant({this.name, this.operatingHours});

  Restaurant.fromJson(Map<String, dynamic> jsonObject)
      : name = jsonObject['name'],
        operatingHours = jsonObject['operatingHours'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'operatingHours': operatingHours,
      };

  List<String> listWeekDays() {
    List<String> weekdays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
    return weekdays;
  }

  Map showListOperatingHours(operatingHours) {
    final List array = operatingHours.split(' / ');
    Map result = {};
    array.forEach((element) {
      List listDays = getListDay(element);
      final List<String> dayArr = element.split(", ");
      final String lastDay = dayArr.last;
      final String timeString = lastDay.substring(lastDay.indexOf(" ") + 1);
      listDays.forEach((day) {
        result[day] = timeString;
      });
    });
    return result;
  }

  String checkTime(String string) {
    final now = new DateTime.now();
    final List<String> dayArr = string.split(", ");
    final String lastDay = dayArr.last;
    final String timeString = lastDay.substring(lastDay.indexOf(" ") + 1);
    final List arrayDate = timeString.split(' - ');
    final startTime = new DateFormat.yMd().add_jm().parse(
        "${new DateFormat.yMd().format(now)} ${arrayDate[0].toUpperCase()}");
    final endTime = new DateFormat.yMd().add_jm().parse(
        "${new DateFormat.yMd().format(now)} ${arrayDate[1].toUpperCase()}");
    if (now.isAfter(startTime) && now.isBefore(endTime)) {
      return 'Opening';
    } else {
      return 'Closed';
    }
  }

  String checkOperatingHours(operatingHours) {
    var now = new DateTime.now();
    final List array = operatingHours.split(' / ');
    final List<String> weekdays = listWeekDays();
    var day = array.firstWhere(
        (e) => getListDay(e).contains(weekdays[now.weekday - 1]),
        orElse: () => null);
    if (day != null) {
      return checkTime(day);
    }
    return 'Closed';
  }

// Get array day from string
  List getListDay(String string) {
    final List<String> weekdays = listWeekDays();
    List<String> days = [];
    final List<String> dayArr = string.split(", ");
    dayArr.asMap().forEach((index, data) {
      var value = index == dayArr.length - 1 ? data.split(" ")[0] : data;
      var valueArr = value.split('-');
      if (valueArr.length > 1) {
        days.addAll(weekdays.sublist(
            weekdays.indexOf(valueArr[0]), weekdays.indexOf(valueArr[1]) + 1));
      } else {
        days.addAll([valueArr[0]]);
      }
    });
    return days;
  }
}
