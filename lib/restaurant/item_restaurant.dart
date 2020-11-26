import 'package:flutter/material.dart';
import 'package:restaurant/restaurant/restaurant_detail.dart';

class ItemRestaurant extends StatelessWidget {
  final String id;
  final String title;
  final String thumb;
  final List days;

  ItemRestaurant(this.id, this.title, this.thumb, this.days);

  String checkTime(day) {
    var now = new DateTime.now();
    var data = days.where((item) => item['type'] == day).toList();
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

  String getStatus(BuildContext context) {
    var now = new DateTime.now();
    final List day = ["mon", "tue", "wed", "thu", "fri", "sat", "sun"];
    return checkTime(day[now.weekday - 1]);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        key: Key('item $id'),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Restaurant(
                        id: id, title: title, thumb: thumb, days: days)));
          },
          child: Padding(
            padding:
                const EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Image.network(
                          thumb,
                          width: 150,
                          height: 150,
                        ))),
                Flexible(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 12),
                      child: Text(
                        title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                    ),
                    Text(
                      getStatus(context),
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  ],
                )),
                SizedBox(width: 20)
              ],
            ),
          ),
        ));
  }
}
